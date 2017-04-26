
package controller;

import component.BookingComponent;
import entity.BookingDetailEntity;
import entity.BookingInfoEntity;
import entity.RoomEntity;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;
import repository.BookingDetailRepository;
import repository.BookingInfoRepository;
import repository.RoomRepository;
import util.MailUtilGmail;

@Controller
@Scope("session")
@RequestMapping(value="/")
public class BookingController {
    
    @Autowired
    BookingDetailRepository bookingDetailRepos;
    
    @Autowired
    BookingInfoRepository bookingInfoRepo;
    
    @Autowired
    RoomRepository roomRepo;
    
    @Autowired
    BookingComponent bookingComponent;
    
    @RequestMapping(value = "addToBooking/{roomID}", method = GET)
    public String addToBooking(@PathVariable("roomID") int roomID,
            @RequestParam(name = "startDate") String startDate,
            @RequestParam(name = "endDate") String endDate,
            Model model) {
        LocalDate startDate1 = LocalDate.parse(startDate);
        LocalDate endDate1 = LocalDate.parse(endDate);
        BookingInfoEntity bookingInfo = new BookingInfoEntity();
        BookingDetailEntity bookingDetail = new BookingDetailEntity(bookingInfo, startDate1, endDate1, roomRepo.findOne(roomID), true);
        if(bookingComponent == null){
            bookingComponent = new BookingComponent();
        }
        bookingComponent.addBookingDetail(bookingDetail);
        List<RoomEntity> roomList = new ArrayList();
        List<RoomEntity> rooms = (List<RoomEntity>) roomRepo.findAll();
        for (RoomEntity room : rooms) {
            if (room.checkAvailable(startDate1, endDate1) == true) {
                roomList.add(room);
            }
        }
        if (!bookingComponent.getBookingDetailList().isEmpty()) {
            for (BookingDetailEntity bookingDetailTemp: bookingComponent.getBookingDetailList()) {
                for (RoomEntity room : roomList) {
                    if (room.getRoomID() == bookingDetailTemp.getRoom().getRoomID()) {
                        roomList.remove(room);
                        break;
                    }
                }
            }
        }
        
        model.addAttribute("roomList", roomList);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        return "roomList";
    }
    @RequestMapping(value = "checkOut",method = GET)
    public String checkOutRoom(Model model){
        List<BookingDetailEntity> bookingDetailList = bookingComponent.getBookingDetailList();
        
        Random ran = new Random();
        long x = ran.nextInt(1000000);
        String bookingCode = String.valueOf(x);
        
        model.addAttribute("bookingInfo",new BookingInfoEntity());
        model.addAttribute("bookingCode", bookingCode);
        model.addAttribute("bookingDetail", bookingDetailList);
        model.addAttribute("action","checkOutFinish");
        return "checkOut";
    }
     @RequestMapping(value = "checkOutFinish", method = POST)
    public String checkOutFinish(BookingInfoEntity bookingInfo,Model model) {
        
        List<BookingDetailEntity> bookingDetailList = new ArrayList<BookingDetailEntity>();
        for(BookingDetailEntity bookingDetail: bookingComponent.getBookingDetailList()){
            bookingDetail.setBookingInfo(bookingInfo);
            bookingDetailList.add(bookingDetail);
        }
        bookingInfo.setBookingDetailList(bookingDetailList);
        bookingComponent.setComponent(bookingDetailList);        
        bookingInfoRepo.save(bookingInfo);
        for(BookingDetailEntity bookingDetail: bookingComponent.getBookingDetailList()){
            bookingDetailRepos.save(bookingDetail);
        }
        int bookingID = bookingInfo.getBookingID();
        BookingInfoEntity bookingInfo1 = bookingInfoRepo.findOne(bookingID);
        
        String from = "kha.dang.2191992@gmail.com";
        String to = bookingInfo1.getCustEmail();
        String subject = "SunLight Hotel ";
        String body = "Thank you ";
        boolean bodyIsHTML = false;
        String message = "";
        try {
            MailUtilGmail.SendMail(to, from, subject, body, bodyIsHTML);
            message = "Send email success";
        } catch (MessagingException e) {
            message = "Send Email Fail !!!";
            System.out.println(e);
        }
        model.addAttribute("message", message);
        bookingComponent.removeBookingDetailList(bookingDetailList);
        return "redirect:/";
    }
}

