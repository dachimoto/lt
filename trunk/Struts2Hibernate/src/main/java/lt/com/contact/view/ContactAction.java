package lt.com.contact.view;
import java.util.List;

import lt.com.contact.controller.ContactManager;
import lt.com.contact.model.Contact;
 
import com.opensymphony.xwork2.ActionSupport;
 
public class ContactAction extends ActionSupport {
 
    private static final long serialVersionUID = 9149826260758390091L;
    private Contact contact;
    private List<Contact> contactList;
    private Long id;
 
    private ContactManager linkController;
 
    public ContactAction() {
        linkController = new ContactManager();
    }
    public String execute() {
        if(null != contact) {
            linkController.add(getContact());
        }
        this.contactList = linkController.list();
        System.out.println(contactList);
        System.out.println(contactList.size());
        return SUCCESS;
    }
    public String add() {
        System.out.println(getContact());
        try {
        linkController.add(getContact());
        }catch(Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }
    public String delete() {
        linkController.delete(getId());
        return SUCCESS;
    }
    public Contact getContact() {
        return contact;
    }
    public List<Contact> getContactList() {
        return contactList;
    }
    public void setContact(Contact contact) {
        this.contact = contact;
    }
    public void setContactList(List<Contact> contactsList) {
        this.contactList = contactsList;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
}