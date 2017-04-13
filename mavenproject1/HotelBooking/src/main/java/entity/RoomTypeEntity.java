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
@Table(name="RoomType")

public class RoomTypeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int roomTypeID;
    
    private String typeName;
    private int numberOfPerson;
    private String description;
    private String images;
    
    @OneToMany(mappedBy = "roomType",fetch = FetchType.EAGER)
    List<RoomEntity> roomList;
    
    public RoomTypeEntity(){
        
    }
    public RoomTypeEntity(String typeName, int numberOfPerson, String description, String images){
        this.typeName=typeName;
        this.numberOfPerson=numberOfPerson;
        this.description=description;
        this.images=images;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getNumberOfPerson() {
        return numberOfPerson;
    }

    public void setNumberOfPerson(int numberOfPerson) {
        this.numberOfPerson = numberOfPerson;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public List<RoomEntity> getRoomList() {
        return roomList;
    }

    public void setRoomList(List<RoomEntity> roomList) {
        this.roomList = roomList;
    }
    
}
