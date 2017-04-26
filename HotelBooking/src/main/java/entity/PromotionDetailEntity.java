package entity;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="PromotionDetail", uniqueConstraints={@UniqueConstraint(columnNames = {"promotionID" , "roomID"})})
//@Table(name="PromotionDetail")

public class PromotionDetailEntity implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int promotionDetailID;
    
    private int promotionID;
    private int roomID;
    
    private LocalDate startDate;
    private LocalDate endDate;
    
    @ManyToOne
    @JoinColumn(name = "promotionID", insertable = false, updatable = false)
    private PromotionEntity promotion;
    
    @ManyToOne
    @JoinColumn(name = "roomID", insertable = false, updatable = false)
    private RoomEntity room;

    public PromotionDetailEntity() {
    }

    public PromotionDetailEntity(int promotionID, int roomID, LocalDate startDate, LocalDate endDate) {
        this.promotionID = promotionID;
        this.roomID = roomID;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public RoomEntity getRoom() {
        return room;
    }

    public void setRoom(RoomEntity room) {
        this.room = room;
    }

    public int getPromotionDetailID() {
        return promotionDetailID;
    }

    public void setPromotionDetailID(int promotionDetailID) {
        this.promotionDetailID = promotionDetailID;
    }

    public int getPromotionID() {
        return promotionID;
    }

    public void setPromotionID(int promotionID) {
        this.promotionID = promotionID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
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

    public PromotionEntity getPromotion() {
        return promotion;
    }

    public void setPromotion(PromotionEntity promotion) {
        this.promotion = promotion;
    }
    
}
