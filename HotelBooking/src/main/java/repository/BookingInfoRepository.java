
package repository;

import entity.BookingInfoEntity;
import org.springframework.data.repository.CrudRepository;

public interface BookingInfoRepository extends CrudRepository<BookingInfoEntity, Integer>{
    
}
