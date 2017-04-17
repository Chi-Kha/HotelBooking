package repository;

import entity.RoomTypeEntity;
import org.springframework.data.repository.CrudRepository;

public interface RoomTypeRepository extends CrudRepository<RoomTypeEntity, Integer>{
    
}
