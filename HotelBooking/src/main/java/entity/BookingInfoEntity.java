
package entity;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "BookingInfo")
public class BookingInfoEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bookingID;
    
    private String bookingCode;
    
    private String custName;
    private String custEmail;
    private String custPhone;

    private boolean status;
    
    @OneToMany(mappedBy = "bookingInfo",fetch = FetchType.EAGER)
    List<BookingDetailEntity> bookingDetailList;
    
    public BookingInfoEntity() {
    }

    public BookingInfoEntity(String bookingCode, String custName, String custEmail, String custPhone, boolean status) {
        this.bookingCode = bookingCode;
        this.custName = custName;
        this.custEmail = custEmail;
        this.custPhone = custPhone;
        this.status = status;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public String getBookingCode() {
        return bookingCode;
    }

    public void setBookingCode(String bookingCode) {
        this.bookingCode = bookingCode;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }

    public String getCustPhone() {
        return custPhone;
    }

    public void setCustPhone(String custPhone) {
        this.custPhone = custPhone;
    }

    public List<BookingDetailEntity> getBookingDetailList() {
        return bookingDetailList;
    }

    public void setBookingDetailList(List<BookingDetailEntity> bookingDetailList) {
        this.bookingDetailList = bookingDetailList;
    }

}
