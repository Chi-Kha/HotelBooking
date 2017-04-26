package controller;

import entity.BookingDetailEntity;
import entity.BookingInfoEntity;
import entity.PromotionDetailEntity;
import entity.PromotionEntity;
import entity.RoomEntity;
import entity.RoomServicesEntity;
import entity.RoomTypeEntity;
import entity.UserEntity;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import javax.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;
import repository.BookingDetailRepository;
import repository.BookingInfoRepository;
import repository.PromotionDetailRepository;
import repository.PromotionRepository;
import repository.RoomRepository;
import repository.RoomServicesRepository;
import repository.RoomTypeRepository;
import repository.UserRepository;
import util.MailUtilsGmail;


@Controller
@RequestMapping(value = "/")
public class HotelController {

    @Autowired
    RoomRepository roomRepo;

    @Autowired
    RoomServicesRepository roomServicesRepo;

    @Autowired
    RoomTypeRepository roomTypeRepo;

    @Autowired
    PromotionRepository promotionRepo;

    @Autowired
    PromotionDetailRepository promotionDetailRepo;

    @Autowired
    BookingInfoRepository bookingInfoRepo;

    @Autowired
    BookingDetailRepository bookingDetailRepo;
    
    @Autowired
    UserRepository userRepo;
    
    

    //Home Page
    @RequestMapping(method = GET)
    public String showHomePage(Model model) {

        List<RoomEntity> room = (List<RoomEntity>) roomRepo.findAll();

        model.addAttribute("roomList", room);
        return "index";
    }

    //Show Room Page
    @RequestMapping(value = "room/{roomID}", method = GET)
    public String viewRoom(Model model, @PathVariable("roomID") int roomID) {

        RoomEntity room = roomRepo.findOne(roomID);

        String imagesFull = room.getRoomType().getImages();
        String[] imageArray = imagesFull.split(Pattern.quote(","));
        model.addAttribute("imageArray", imageArray);
        model.addAttribute("room", room);

        model.addAttribute("action", "booking");
        return "room";
    }
    // Search booking via BookingCode
    @RequestMapping(value = "searchBooking", method = GET)
    public String searchBooking(@RequestParam(name = "bookingCode") String bookingCode, Model model) {
        List<BookingInfoEntity> bookingInfoList = (List<BookingInfoEntity>) bookingInfoRepo.findAll();
        BookingInfoEntity book = new BookingInfoEntity();
        for (BookingInfoEntity booking : bookingInfoList) {
            if (booking.getBookingCode().equals(bookingCode)) {
                book = booking;
            }
        }
        model.addAttribute("book", book);
        return "searchBooking";
    }
    // Cancel Booking below
    @RequestMapping(value = "cancelBooking/{bookingCode}/{roomID}", method = GET)
    public String cancelBookingRoom(@PathVariable(name = "bookingCode") String bookingCode,
            @PathVariable(name = "roomID") int roomID, Model model) {
        List<BookingInfoEntity> bookingInfoList = (List<BookingInfoEntity>) bookingInfoRepo.findAll();
        BookingInfoEntity book = new BookingInfoEntity();
        for (BookingInfoEntity booking : bookingInfoList) {
            if (booking.getBookingCode().equals(bookingCode)) {
                book = booking;
            }
        }
        List<BookingDetailEntity> bookingDetailList = book.getBookingDetailList();
        for (BookingDetailEntity bookingDetail : bookingDetailList) {
            if (bookingDetail.getRoom().getRoomID() == roomID) {
                bookingDetailList.remove(bookingDetail);
                bookingDetail.setStatus(false);
                bookingDetailRepo.save(bookingDetail);
                bookingDetailList.add(bookingDetail);
                break;
            }
        }
        book.setBookingDetailList(bookingDetailList);
        model.addAttribute("book", book);
        return "searchBooking";
    }
    @RequestMapping(value = "cancelBooking/{bookingCode}", method = GET)
    public String cancelBooking(@PathVariable(name = "bookingCode") String bookingCode, Model model) {
        List<BookingInfoEntity> bookingInfoList = (List<BookingInfoEntity>) bookingInfoRepo.findAll();
        BookingInfoEntity book = new BookingInfoEntity();
        for (BookingInfoEntity booking : bookingInfoList) {
            if (booking.getBookingCode().equals(bookingCode)) {
                book = booking;
            }
        }
        String roomString = "";
        for (BookingDetailEntity bookingDetail : book.getBookingDetailList()) {
            roomString = roomString + bookingDetail.getRoom().getRoomName() + " ";
            String from = "testjavadanang@gmail.com";
            String subject = "Confirmation Email";
            String confirmLink = "http://localhost:8080/HotelBookingNew/cancelBookingConfirm/" 
                    + bookingCode + "?confirmation=yes";
            String content = "<h1>Confirmation Email<h1>"
                    + "<p>Please click to the link below to confirm remove your booking</p>"
                    + "<a href=" + confirmLink + ">Confirmation Link</a><br>"
                    + "Customer Name: " + book.getCustName() + "<br"
                    + "Booking Code: " + book.getBookingCode() + "<br>"
                    + "Booking Room: " + roomString;
            boolean bodyIsHTML = true;
            try {
                MailUtilsGmail.sendMail(book.getCustEmail(), from, subject, content, bodyIsHTML);
            } catch (MessagingException e) {
            }
        }
        model.addAttribute("book", book);
        return "searchBooking";
    }
    @RequestMapping(value = "cancelBookingConfirm/{bookingCode}", method = GET)
    public String cancelBookingConfirm(@PathVariable(name = "bookingCode") String bookingCode,
            @RequestParam(name = "confirmation") String confirmation, Model model) {
        List<BookingInfoEntity> bookingInfoList = (List<BookingInfoEntity>) bookingInfoRepo.findAll();
        BookingInfoEntity book = new BookingInfoEntity();
        for (BookingInfoEntity booking : bookingInfoList) {
            if (booking.getBookingCode().equals(bookingCode)) {
                book = booking;
            }
        }
        if(confirmation.equals("yes")){
            book.setStatus(false);
            bookingInfoRepo.save(book);
        }
        model.addAttribute("book", book);
        return "searchBooking";
    }
    //-------------------------------//
    //Search Room Available
    @RequestMapping(value = "availableRoom", method = GET)
    public String availableRoom(@RequestParam(name = "startDate") String startDate,
            @RequestParam(name = "endDate") String endDate, Model model) {
        List<RoomEntity> roomList = new ArrayList();
        LocalDate startDate1 = LocalDate.parse(startDate);
        LocalDate endDate1 = LocalDate.parse(endDate);
        List<RoomEntity> rooms = (List<RoomEntity>) roomRepo.findAll();
        for (RoomEntity room : rooms) {
            if (room.checkAvailable(startDate1, endDate1) == true) {
                roomList.add(room);
            }
        }
        //Xem phong nao dang co khuyen mai
        LocalDate currentDate = LocalDate.now();
        List<PromotionDetailEntity> promotionDetails = new ArrayList();
        List<PromotionDetailEntity> promotionDetailList = (List<PromotionDetailEntity>) promotionDetailRepo.findAll();
        for (PromotionDetailEntity promotionDetail : promotionDetailList) {
            if (currentDate.isBefore(promotionDetail.getEndDate())) {
                promotionDetails.add(promotionDetail);
                RoomEntity roomTemp = promotionDetail.getRoom();
                roomList.remove(roomTemp);
            }
        }
        model.addAttribute("roomList", roomList);
        model.addAttribute("promotionDetails", promotionDetails);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        return "roomList";
    }
    //------------------------------//
    //create User
    
    //------------------------------//
    //Promotion
    @RequestMapping(value = "promotion", method = GET)
    public String promotion(Model model) {
        List<PromotionEntity> promotionList = (List<PromotionEntity>) promotionRepo.findAll();
        model.addAttribute("promotionList", promotionList);
        return "promotion";
    }

    @RequestMapping(value = "promotion/{promotionID}", method = GET)
    public String viewPromotion(@PathVariable("promotionID") int promotionID, Model model) {
        PromotionEntity promotion = promotionRepo.findOne(promotionID);
        List<PromotionDetailEntity> promotionDetailList = promotion.getPromotionDetailList();
        model.addAttribute("promotionDetailList", promotionDetailList);
        return "promotionDetail";
    }
    //-------------------------------//
    //Admin Home

    @RequestMapping(value = "admin", method = GET)
    public String showManagerPage(Model model) {
        return "admin/login";
    }
    @RequestMapping(value = "admin/admin/",method = GET)
    public String showAdminPage(Model model){
        return "admin/admin/admin";
    }
    @RequestMapping(value = "admin/userManagement/",method = GET)
    public String showUserPage(Model model){
        return "admin/userManagement/functions";
    }
    //RoomType
    @RequestMapping(value = "admin/roomType", method = GET)
    public String showRoomTypes(Model model) {
        List<RoomTypeEntity> roomTypeList = (List<RoomTypeEntity>) roomTypeRepo.findAll();
        model.addAttribute("roomTypeList", roomTypeList);
        return "admin/userManagement/roomType";
    }

    @RequestMapping(value = "admin/addRoomType", method = GET)
    public String addRoomType(Model model) {
        String action = "addRoomType";
        model.addAttribute("roomType", new RoomTypeEntity());
        model.addAttribute("action", action);
        return "admin/userManagement/addRoomType";
    }

    @RequestMapping(value = "admin/addRoomType", method = POST)
    public String saveRoomType(RoomTypeEntity roomType) {
        roomTypeRepo.save(roomType);
        return "redirect:/admin/userManagement/";
    }

    @RequestMapping(value = "admin/deleteRoomType/{roomTypeID}", method = GET)
    public String deleteRoomType(@PathVariable("roomTypeID") int roomTypeID) {
        roomTypeRepo.delete(roomTypeID);
        return "redirect:/admin/userManagement/roomType";
    }

    @RequestMapping(value = "admin/editRoomType/{roomTypeID}", method = GET)
    public String editRoomType(@PathVariable("roomTypeID") int roomTypeID, Model model) {
        RoomTypeEntity roomType = roomTypeRepo.findOne(roomTypeID);
        String action = "updateRoomType";
        model.addAttribute("roomType", roomType);
        model.addAttribute("action", action);
        model.addAttribute("readonly", true);
        return "admin/userManagement/addRoomType";
    }

    @RequestMapping(value = "admin/updateRoomType", method = POST)
    public String updateRoomType(RoomTypeEntity roomType) {
        roomTypeRepo.save(roomType);
        return "redirect:/admin/userManagement/";
    }

    //Room
    @RequestMapping(value = "admin/room", method = GET)
    public String showRooms(Model model) {
        List<RoomEntity> roomList = (List<RoomEntity>) roomRepo.findAll();
        model.addAttribute("roomList", roomList);
        return "admin/userManagement/room";
    }

    @RequestMapping(value = "admin/addRoom", method = GET)
    public String addRoom(Model model) {
        String action = "addRoom";
        List<RoomTypeEntity> roomTypeList = (List<RoomTypeEntity>) roomTypeRepo.findAll();
        model.addAttribute("room", new RoomEntity());
        model.addAttribute("roomTypeList", roomTypeList);
        model.addAttribute("action", action);
        return "admin/userManagement/addRoom";
    }

    @RequestMapping(value = "admin/addRoom", method = POST)
    public String saveRoom(RoomEntity room) {
        RoomTypeEntity roomType = roomTypeRepo.findOne(room.getRoomType().getRoomTypeID());
        room.setRoomType(roomType);
        roomRepo.save(room);
        return "redirect:/admin/userManagement";
    }

    @RequestMapping(value = "admin/deleteRoom/{roomID}", method = GET)
    public String deleteRoom(@PathVariable("roomID") int roomID) {
        roomRepo.delete(roomID);
        return "redirect:/admin/userManagement/room";
    }

    @RequestMapping(value = "admin/editRoom/{roomID}", method = GET)
    public String editRoom(@PathVariable("roomID") int roomID, Model model) {
        RoomEntity room = roomRepo.findOne(roomID);
        String action = "updateRoom";
        List<RoomTypeEntity> roomTypeList = (List<RoomTypeEntity>) roomTypeRepo.findAll();
        model.addAttribute("room", room);
        model.addAttribute("roomTypeList", roomTypeList);
        model.addAttribute("action", action);
        model.addAttribute("readonly", true);
        return "admin/userManagement/addRoom";
    }

    @RequestMapping(value = "admin/updateRoom", method = POST)
    public String updateRoom(RoomEntity room) {
        RoomTypeEntity roomType = roomTypeRepo.findOne(room.getRoomType().getRoomTypeID());
        room.setRoomType(roomType);
        roomRepo.save(room);
        return "redirect:/admin/userManagement";
    }

    //RoomService
    @RequestMapping(value = "admin/roomService", method = GET)
    public String showRoomServices(Model model) {
        List<RoomServicesEntity> roomServiceList = (List<RoomServicesEntity>) roomServicesRepo.findAll();
        model.addAttribute("roomServiceList", roomServiceList);
        return "admin/userManagement/roomService";
    }

    @RequestMapping(value = "admin/addRoomService", method = GET)
    public String addRoomService(Model model) {
        String action = "addRoomService";
        List<RoomEntity> roomList = (List<RoomEntity>) roomRepo.findAll();
        model.addAttribute("roomService", new RoomServicesEntity());
        model.addAttribute("roomList", roomList);
        model.addAttribute("action", action);
        return "admin/userManagement/addRoomService";
    }

    @RequestMapping(value = "admin/addRoomService", method = POST)
    public String saveRoomService(RoomServicesEntity roomService) {
        roomServicesRepo.save(roomService);
        return "redirect:/admin/userManagement";
    }

    @RequestMapping(value = "admin/editRoomService/{roomID}", method = GET)
    public String editRoomService(@PathVariable("roomID") int roomID, Model model) {
        RoomServicesEntity roomService = roomServicesRepo.findOne(roomID);
        String action = "updateRoomService";
        model.addAttribute("roomService", roomService);
        model.addAttribute("action", action);
        model.addAttribute("readonly", true);
        return "admin/userManagement/addRoomService";
    }

    @RequestMapping(value = "admin/updateRoomService", method = POST)
    public String updateRoomService(RoomServicesEntity roomService) {
        roomServicesRepo.save(roomService);
        return "redirect:/admin/userManagement";
    }

    //Promotion
    @RequestMapping(value = "admin/promotion", method = GET)
    public String showPromotion(Model model) {
        List<PromotionEntity> promotionList = (List<PromotionEntity>) promotionRepo.findAll();
        model.addAttribute("promotionList", promotionList);
        return "admin/userManagement/promotion/";
    }

    @RequestMapping(value = "admin/addPromotion", method = GET)
    public String addPromotion(Model model) {
        String action = "addPromotion";
        model.addAttribute("promotion", new PromotionEntity());
        model.addAttribute("action", action);
        return "admin/userManagement/addPromotion";
    }

    @RequestMapping(value = "admin/addPromotion", method = POST)
    public String savePromotion(PromotionEntity promotion) {
        promotionRepo.save(promotion);
        return "redirect:/admin/userManagement";
    }

    @RequestMapping(value = "admin/editPromotion/{promotionID}", method = GET)
    public String editPromotion(@PathVariable("promotionID") int promotionID, Model model) {
        PromotionEntity promotion = promotionRepo.findOne(promotionID);
        String action = "updatePromotion";
        model.addAttribute("promotion", promotion);
        model.addAttribute("action", action);
        model.addAttribute("readonly", true);
        return "admin/userManagement/addPromotion";
    }

    @RequestMapping(value = "admin/updatePromotion", method = POST)
    public String updatePromotion(PromotionEntity promotion) {
        promotionRepo.save(promotion);
        return "redirect:/admin/userManagement";
    }

    //Booking Management
    @RequestMapping(value = "admin/booking", method = GET)
    public String showBooking(Model model) {
        List<BookingInfoEntity> bookingList = (List<BookingInfoEntity>) bookingInfoRepo.findAll();
        model.addAttribute("bookingList", bookingList);
        return "admin/userManagement/booking";
    }

    @RequestMapping(value = "admin/addBooking", method = GET)
    public String addBooking(Model model) {
        String action = "addBooking";
        model.addAttribute("booking", new BookingInfoEntity());
        model.addAttribute("action", action);
        return "admin/userManagement/addBooking";
    }

    @RequestMapping(value = "admin/addBooking", method = POST)
    public String saveBooking(BookingInfoEntity booking) {
        bookingInfoRepo.save(booking);
        return "redirect:/admin/userManagement";
    }

    @RequestMapping(value = "admin/deleteBooking/{bookingID}", method = GET)
    public String deleteBooking(@PathVariable("bookingID") int bookingID) {
        roomTypeRepo.delete(bookingID);
        return "redirect:/admin/userManagement/booking";
    }

    @RequestMapping(value = "admin/editBooking/{bookingID}", method = GET)
    public String editBooking(@PathVariable("bookingID") int bookingID, Model model) {
        BookingInfoEntity booking = bookingInfoRepo.findOne(bookingID);
        String action = "updateBooking";
        model.addAttribute("booking", booking);
        model.addAttribute("action", action);
        model.addAttribute("readonly", true);
        return "admin/userManagement/addBooking";
    }

    @RequestMapping(value = "admin/updateBooking", method = POST)
    public String updateBooking(BookingInfoEntity booking) {
        bookingInfoRepo.save(booking);
        return "redirect:/admin/userManagement";
    }

    //Booking Detail Management
    @RequestMapping(value = "admin/bookingDetail", method = GET)
    public String showBookingDetail(Model model) {
        List<BookingDetailEntity> bookingDetailList = (List<BookingDetailEntity>) bookingDetailRepo.findAll();
        model.addAttribute("bookingDetailList", bookingDetailList);
        return "admin/userManagement/bookingDetail";
    }
    
    //Register User
    @RequestMapping(value = "admin/registerUser", method = GET)
    public String registerUser(Model model){
        String action = "registerUser";
        
        model.addAttribute("users", new UserEntity());
        model.addAttribute("action", action);
        
        return "admin/admin/createUser";
    }
    @RequestMapping(value = "admin/registerUser", method = POST)
    public String saveNewUser(UserEntity users) {
        userRepo.save(users);
        return "redirect:/admin/admin/";
    }
    
}
