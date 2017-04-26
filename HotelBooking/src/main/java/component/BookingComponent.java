
package component;

import entity.BookingDetailEntity;
import java.util.ArrayList;
import java.util.List;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("session")
public class BookingComponent {

    private List<BookingDetailEntity> bookingDetailList;
    
    public BookingComponent() {
        bookingDetailList = new ArrayList<BookingDetailEntity>();
    }

    public List<BookingDetailEntity> getBookingDetailList() {
        return bookingDetailList;
    }

    public void setBookingDetailList(List<BookingDetailEntity> bookingDetailList) {
        this.bookingDetailList = bookingDetailList;
    }
    
    public void setComponent(List<BookingDetailEntity> bookingDetail){
        this.bookingDetailList = bookingDetail;
    }
    
    public void addBookingDetail(BookingDetailEntity bookingDetail) {
        bookingDetailList.add(bookingDetail);
    }

    public void removeBookingDetail(BookingDetailEntity bookingDetail) {

    }
    public void removeBookingDetailList(List<BookingDetailEntity> bookingDetails){
        bookingDetailList = new ArrayList<BookingDetailEntity>();
    }

}

