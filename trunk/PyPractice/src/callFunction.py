# Defines a "repeat" function that takes 2 arguments.
def repeat(s, exclaim):
    """Returns the string s repeated 3 times.
    If exclaim is true, adds exclamation marks.
    """
    
    result = s + s + s
    if exclaim:
        result = result + '!!!'
    return result

# Notice also how the lines that make up the function or if-statement
# are grouped by  all having the same indentation.

def main():
    print repeat('Yay', False)      ## Yay
    print repeat('Woo Hoo', True)   ## Woo Hoo!!!
    
# Standard boilerplate to call the main() function to begin
# the program.
if __name__ == '__main__':
    main()