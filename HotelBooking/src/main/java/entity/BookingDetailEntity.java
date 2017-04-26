
package entity;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="BookingDetail")
public class BookingDetailEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bookingDetailID;
    
    @ManyToOne
    @JoinColumn(name = "bookingID")
    private BookingInfoEntity bookingInfo;
    
    private LocalDate startDate;
    private LocalDate endDate;
    
    @ManyToOne
    @JoinColumn(name = "roomID")
    private RoomEntity room;
    
    private boolean status;

    public BookingDetailEntity() {
    }

    public BookingDetailEntity(BookingInfoEntity bookingInfo, LocalDate startDate, LocalDate endDate, RoomEntity room, boolean status) {
        this.bookingInfo = bookingInfo;
        this.startDate = startDate;
        this.endDate = endDate;
        this.room = room;
        this.status = status;
    }

    public int getBookingDetailID() {
        return bookingDetailID;
    }

    public void setBookingDetailID(int bookingDetailID) {
        this.bookingDetailID = bookingDetailID;
    }

    public BookingInfoEntity getBookingInfo() {
        return bookingInfo;
    }

    public void setBookingInfo(BookingInfoEntity bookingInfo) {
        this.bookingInfo = bookingInfo;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public RoomEntity getRoom() {
        return room;
    }

    public void setRoom(RoomEntity room) {
        this.room = room;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
}
