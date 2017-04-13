
package entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="RoomServices")
public class RoomServicesEntity {
    
    @Id
    private int roomID;
    private boolean coffee;
    private boolean breakfast;
    private boolean massage;
    private boolean bicycle;
    private boolean swimmingPool;
    
    @OneToOne(mappedBy = "roomServices")
    private RoomEntity room;
    
    public RoomServicesEntity(){
        
    }

    public RoomServicesEntity(boolean coffee, boolean breakfast, boolean massage, boolean bicycle, boolean swimmingPool, RoomEntity room) {
        this.coffee = coffee;
        this.breakfast = breakfast;
        this.massage = massage;
        this.bicycle = bicycle;
        this.swimmingPool = swimmingPool;
        this.room = room;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public boolean isCoffee() {
        return coffee;
    }

    public void setCoffee(boolean coffee) {
        this.coffee = coffee;
    }

    public boolean isBreakfast() {
        return breakfast;
    }

    public void setBreakfast(boolean breakfast) {
        this.breakfast = breakfast;
    }

    public boolean isMassage() {
        return massage;
    }

    public void setMassage(boolean massage) {
        this.massage = massage;
    }

    public boolean isBicycle() {
        return bicycle;
    }

    public void setBicycle(boolean bicycle) {
        this.bicycle = bicycle;
    }

    public boolean isSwimmingPool() {
        return swimmingPool;
    }

    public void setSwimmingPool(boolean swimmingPool) {
        this.swimmingPool = swimmingPool;
    }

    public RoomEntity getRoom() {
        return room;
    }

    public void setRoom(RoomEntity room) {
        this.room = room;
    }
    
    
    
}
