
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
@Table(name="Promotion")
public class PromotionEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int promotionID;
    
    private String description;
    private String images;
    
    @OneToMany(mappedBy = "promotion",fetch = FetchType.EAGER)
    List<PromotionDetailEntity> promotionDetailList;
    
    public PromotionEntity(){
        
    }
    
    public PromotionEntity(String description, String images){
        this.description = description;
        this.images = images;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public int getPromotionID() {
        return promotionID;
    }

    public void setPromotionID(int promotionID) {
        this.promotionID = promotionID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<PromotionDetailEntity> getPromotionDetailList() {
        return promotionDetailList;
    }

    public void setPromotionDetailList(List<PromotionDetailEntity> promotionDetailList) {
        this.promotionDetailList = promotionDetailList;
    }
    
    
}
