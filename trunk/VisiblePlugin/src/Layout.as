// ActionScript file
package {
		import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	public class Layout extends LayoutConstraint {
		public static function defaultChangeHandler(event:Event):void {
			var layout:Layout = Layout(event.target);
			var layoutTarget:DisplayObject = layout.target;
			if (!layoutTarget || layoutTarget is Stage) return;
			var layoutRect:Rectangle = layout.rect;
			layoutTarget.x = layoutRect.x;
			layoutTarget.y = layoutRect.y;
			layoutTarget.width = layoutRect.width;
			layoutTarget.height = layoutRect.height;
		}
		internal static function updateChanged(changedList:Dictionary):void {
			var layout:Layout;
			for (var element:* in changedList) {
				layout = Layout(element);
				if (layout.lastRect.x != layout._rect.x || layout.lastRect.y != layout._rect.y
				|| layout.lastRect.width != layout._rect.width || layout.lastRect.height != layout._rect.height) {
					
					// dispatch the change event so 
					// instances will know their bounding
					// boxes (layout.rect) have changed
					layout.dispatchEvent(new Event(Event.CHANGE));
					
					// update last rect values
					layout.lastRect = layout._rect.clone();
				}
			}
		}
		public function get useDefaultChangeHandler():Boolean {
			return _useDefaultChangeHandler;
		}
		public function set useDefaultChangeHandler(value:Boolean):void {
			if (value == _useDefaultChangeHandler) return;
				
			// remove the current change handler if exists
			if (_useDefaultChangeHandler) {
				removeEventListener(Event.CHANGE, defaultChangeHandler, false);
			}
			_useDefaultChangeHandler = value;
			
			// add the new change handler if not null
			if (_useDefaultChangeHandler) {
				addEventListener(Event.CHANGE, defaultChangeHandler, false, 0, true);
			}
		}
		private var _useDefaultChangeHandler:Boolean;
		public function get parent():Layout {
			// return explicit parent if set
			if (_parent) return _parent;
			
			// if _parent not defined, look in
			// the target's parent for a registered
			// layout which targets this instance
			// as a child layout
			if (_manager && _target && _target.parent in _manager.registeredList) {
				return Layout(_manager.registeredList[_target.parent]);
			}
			
			// no parent found, return null
			return null;
		}
		private var _parent:Layout;
		public function get children():LayoutConstraint {
			return _children;
		}
		
		public function set children(value:LayoutConstraint):void {
			if (_children) {
				// remove any owner reference in the
				// current _children object
				_children.owner = null;
			}
			
			// assign children constraint; it cannot be 'this'
			_children = value != this ? value : null;
			
			if (_children) {
				// set up owner Layout instance. This will
				// be the Layout instance if this constraint
				// is for Layout.children, otherwise as a
				// Layout constraint, it will reference itself
				_children.owner = this;
				// child rectangles (for children constraints)
				// do not inherit positioning and are based on
				// the coordinate space (starting at 0,0)
				// of the current layout rectangle
				_children.setIn(new Rectangle(0, 0, _rect.width, _rect.height));
			}
		}
		private var _children:LayoutConstraint;
		public function get manager():LayoutManager {
			return _manager;
		}
		/**
		 * @private
		 */
		internal var _manager:LayoutManager;

		/**
		 * The target display object this layout affects.
		 */
		public function get target():DisplayObject {
			return _target;
		}
		
		public function set target(value:DisplayObject):void {
			if (value == _target) return;
			// remove resize listener if current target is stage
			if (_target is Stage) {
				_target.removeEventListener(Event.RESIZE, stageResized, false);
			}
			_target = value;
			// add resize listener if new target is stage
			if (_target is Stage) {
				_target.addEventListener(Event.RESIZE, stageResized, false, 0, true);
			}
		}
		internal var _target:DisplayObject;
		internal var lastRect:Rectangle = new Rectangle();
		internal var childList:Dictionary = new Dictionary(true);
		public function Layout(target:DisplayObject = null, useDefaultChangeHandler:Boolean = true) {
			// default target rectangle
			var targetRect:Rectangle = new Rectangle(0, 0, 100, 100);
			
			if (target) {
				
				// assign the target (display object)
				// using this layout
				this.target = target;
					
				// set up the constraint for the target using
				// this Layout instance. A special case is made
				// if target is the stage instance where the
				// initial rect is based on the stage size.
				// Otherwise its based on the target location and size.
				if (_target is Stage) {
					targetRect = new Rectangle(0, 0, Stage(_target).stageWidth, Stage(_target).stageHeight);
					
				// don't default to the target size
				// if it has no size
				}else if (_target.width && _target.height) {
					targetRect = new Rectangle(_target.x, _target.y, _target.width, _target.height);
				}
				
			}
			
			// call constraint super
			super(targetRect);
			// assign the owner of the constraint
			// to be this layout instance
			owner = this;
			
			// assign changeHandler listener
			this.useDefaultChangeHandler = useDefaultChangeHandler;
		}
		override public function clone():LayoutConstraint {
			var layout:Layout = new Layout(_target, _useDefaultChangeHandler);
			layout.match(this);
			if (_children) {
				layout.children = _children.clone();
			}
			if (_parent) {
				_parent.addChild(layout);
			}
			return layout;
		}
		public function addChild(childLayout:Layout):Layout {
			if (childLayout._parent) {
				childLayout._parent.removeChild(childLayout);
			}
			childList[childLayout] = true;
			childLayout._parent = this;
			return childLayout;
		}
		
		/**
		 * Removes a layout as a child of this layout.
		 * @param childLayout The layout to be removed as a
		 * 		child of the current layout.
		 */
		public function removeChild(childLayout:Layout):Layout {
			if (childLayout in childList) {
				delete childList[childLayout];
				childLayout._parent = null;
			}
			return childLayout;
		}
		public function draw():void {
			var changedList:Dictionary = new Dictionary(true);
			_draw(changedList);
			updateChanged(changedList);
		}
		
		/**
		 * Invalidates the instance so that it
		 * will be validated during the next update
		 * @private
		 */
		internal override function invalidate():void {
			
			// make sure instance is invalid
			// using inherited invalidate
			super.invalidate();
			
			if (_manager) {
				_manager.invalidate(this);
			}
		}
		
		/**
		 * Internal version of draw which does the actual drawing
		 * @private
		 */
		internal function _draw(changedList:Dictionary):void {
			// mark layout as changed
			// only layouts in changed list will
			// dispatch the CHANGE event and
			// only if their rect has changed
			changedList[this] = true;
			
			
			// if there is a specified parent, use it
			// to fit this layout to fit within 
			// the parent children contraint
			if (_parent) {
				if (_parent._children){
					setIn(_parent._children._rect);
				}else{
					setIn(new Rectangle(0, 0, _parent._rect.width, _parent._rect.height));
				}
				
			// if no explicit parent, rely on the parent
			// of the target display object and check to
			// see if it is registered with a layout
			}else if (_manager && _target && _target.parent in _manager.registeredList) {
				var parentLayout:Layout = Layout(_manager.registeredList[_target.parent]);
				if (parentLayout._children){
					setIn(parentLayout._children._rect);
				}else{
					setIn(new Rectangle(0, 0, parentLayout._rect.width, parentLayout._rect.height));
				}
				
			// if no parent found, set in a null area this
			// allows x, y, width, and height to still
			// be observed with the appropriate limits
			}else{
				setIn(null);
			}
			
			
			if (_children) {
				// update the children constraint
				// to fit within the current layout
				// child rectangles (for children constraints)
				// do not inherit positioning and are based on
				// the coordinate space (starting at 0,0)
				// of the current layout rectangle
				_children.setIn(new Rectangle(0, 0, _rect.width, _rect.height));
				
				// children no longer invalid
				_children.invalid = false;
			}

			// loop through all the children of the
			// parent layout and draw all the 
			// children which are registered
			
			// first check any children within the childList
			for (var element:* in childList) {
				Layout(element)._draw(changedList);
			}
				
			// second check registered layouts in the target container
			if (_manager && _target is DisplayObjectContainer) {
				
				var targetContainer:DisplayObjectContainer = DisplayObjectContainer(_target);
				var i:int = targetContainer.numChildren;
				var child:DisplayObject;
				while(i--) {
					child = targetContainer.getChildAt(i);
					
					// draw the child if it is registered
					// under the same manager as this instance
					if (child in _manager.registeredList) {
						Layout(_manager.registeredList[child])._draw(changedList);
					}	
				}
			}
			
			// clear layout invalid flags
			invalid = false;
			if (_manager) {
				delete _manager.invalidList[this];
			}
		}
		
		/*
		 * Event handler for stage resizing if target is the stage
		 */
		private function stageResized(event:Event):void {
			// remove resize listener if target
			// finds itself not being the stage
			if (!(_target is Stage)) {
				removeEventListener(Event.RESIZE, stageResized);
				return;
			}
			
			// set the width and height to be
			// the width and height of the sta
			ge
			width = Stage(_target).stageWidth;
			height = Stage(_target).stageHeight;
			
			// update
			draw();
		}
	}
}