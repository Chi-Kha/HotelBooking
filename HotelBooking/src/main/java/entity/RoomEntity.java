package entity;

import java.time.LocalDate;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="Room")
public class RoomEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int roomID;
    
    private String roomName;
    
    @ManyToOne
    @JoinColumn(name = "roomTypeID")
    private RoomTypeEntity roomType;
    
    private boolean status;
    private double price;
    private String images;
    
    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER) //cascade : list BookDetailsEntity theo table Book
    @PrimaryKeyJoinColumn
    private RoomServicesEntity roomServices;
    
    @OneToMany(mappedBy = "room",fetch = FetchType.EAGER)
    List<BookingDetailEntity> bookingDetailList;
    
    public RoomEntity(){
        
    }

    public RoomEntity(String roomName, int roomTypeID, RoomTypeEntity roomType,
            boolean status, double price, String images) {
        this.roomName = roomName;
        this.roomType = roomType;
        this.status = status;
        this.price = price;
        this.images = images;
    }

    public RoomServicesEntity getRoomServices() {
        return roomServices;
    }

    public void setRoomServices(RoomServicesEntity roomServices) {
        this.roomServices = roomServices;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public RoomTypeEntity getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomTypeEntity roomType) {
        this.roomType = roomType;
    }

    public List<BookingDetailEntity> getBookingDetailList() {
        return bookingDetailList;
    }

    public void setBookingDetailList(List<BookingDetailEntity> bookingDetailList) {
        this.bookingDetailList = bookingDetailList;
    }
    
    public boolean checkAvailable(LocalDate startDate, LocalDate endDate){
        List<BookingDetailEntity> bookingDetailList = this.getBookingDetailList();
        boolean available = true;
        for(BookingDetailEntity bookingDetail: bookingDetailList){
            if(startDate.isAfter(bookingDetail.getStartDate()) && startDate.isBefore(bookingDetail.getEndDate()) ||
                    endDate.isAfter(bookingDetail.getStartDate()) && endDate.isBefore(bookingDetail.getEndDate())){
                available = false;
            }else {
                available = true;
            }
        }
        return available;
    }
}
