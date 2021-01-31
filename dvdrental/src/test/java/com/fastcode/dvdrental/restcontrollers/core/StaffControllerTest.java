package com.fastcode.dvdrental.restcontrollers.core;

import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.fastcode.dvdrental.application.core.address.AddressAppService;
import com.fastcode.dvdrental.application.core.payment.PaymentAppService;
import com.fastcode.dvdrental.application.core.rental.RentalAppService;
import com.fastcode.dvdrental.application.core.staff.StaffAppService;
import com.fastcode.dvdrental.application.core.staff.dto.*;
import com.fastcode.dvdrental.application.core.store.StoreAppService;
import com.fastcode.dvdrental.commons.logging.LoggingHelper;
import com.fastcode.dvdrental.commons.search.SearchUtils;
import com.fastcode.dvdrental.domain.core.address.AddressEntity;
import com.fastcode.dvdrental.domain.core.address.IAddressRepository;
import com.fastcode.dvdrental.domain.core.city.CityEntity;
import com.fastcode.dvdrental.domain.core.city.ICityRepository;
import com.fastcode.dvdrental.domain.core.country.CountryEntity;
import com.fastcode.dvdrental.domain.core.country.ICountryRepository;
import com.fastcode.dvdrental.domain.core.customer.CustomerEntity;
import com.fastcode.dvdrental.domain.core.customer.ICustomerRepository;
import com.fastcode.dvdrental.domain.core.film.FilmEntity;
import com.fastcode.dvdrental.domain.core.film.IFilmRepository;
import com.fastcode.dvdrental.domain.core.inventory.IInventoryRepository;
import com.fastcode.dvdrental.domain.core.inventory.InventoryEntity;
import com.fastcode.dvdrental.domain.core.language.ILanguageRepository;
import com.fastcode.dvdrental.domain.core.language.LanguageEntity;
import com.fastcode.dvdrental.domain.core.rental.IRentalRepository;
import com.fastcode.dvdrental.domain.core.rental.RentalEntity;
import com.fastcode.dvdrental.domain.core.staff.IStaffRepository;
import com.fastcode.dvdrental.domain.core.staff.IStaffRepository;
import com.fastcode.dvdrental.domain.core.staff.StaffEntity;
import com.fastcode.dvdrental.domain.core.staff.StaffEntity;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import java.time.*;
import java.util.*;
import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityNotFoundException;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;
import org.springframework.core.env.Environment;
import org.springframework.data.web.SortHandlerMethodArgumentResolver;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT, properties = "spring.profiles.active=test")
public class StaffControllerTest {

    @Autowired
    protected SortHandlerMethodArgumentResolver sortArgumentResolver;

    @Autowired
    @Qualifier("staffRepository")
    protected IStaffRepository staff_repository;

    @Autowired
    @Qualifier("addressRepository")
    protected IAddressRepository addressRepository;

    @Autowired
    @Qualifier("rentalRepository")
    protected IRentalRepository rentalRepository;

    @Autowired
    @Qualifier("languageRepository")
    protected ILanguageRepository languageRepository;

    @Autowired
    @Qualifier("customerRepository")
    protected ICustomerRepository customerRepository;

    @Autowired
    @Qualifier("filmRepository")
    protected IFilmRepository filmRepository;

    @Autowired
    @Qualifier("staffRepository")
    protected IStaffRepository staffRepository;

    @Autowired
    @Qualifier("countryRepository")
    protected ICountryRepository countryRepository;

    @Autowired
    @Qualifier("cityRepository")
    protected ICityRepository cityRepository;

    @Autowired
    @Qualifier("inventoryRepository")
    protected IInventoryRepository inventoryRepository;

    @SpyBean
    @Qualifier("staffAppService")
    protected StaffAppService staffAppService;

    @SpyBean
    @Qualifier("addressAppService")
    protected AddressAppService addressAppService;

    @SpyBean
    @Qualifier("paymentAppService")
    protected PaymentAppService paymentAppService;

    @SpyBean
    @Qualifier("rentalAppService")
    protected RentalAppService rentalAppService;

    @SpyBean
    @Qualifier("storeAppService")
    protected StoreAppService storeAppService;

    @SpyBean
    protected LoggingHelper logHelper;

    @SpyBean
    protected Environment env;

    @Mock
    protected Logger loggerMock;

    protected StaffEntity staff;

    protected MockMvc mvc;

    @Autowired
    EntityManagerFactory emf;

    static EntityManagerFactory emfs;

    static int relationCount = 10;

    int countAddress = 10;

    int countRental = 10;

    int countLanguage = 10;

    int countCustomer = 10;

    int countFilm = 10;

    int countStaff = 10;

    int countCountry = 10;

    int countCity = 10;

    int countInventory = 10;

    @PostConstruct
    public void init() {
        emfs = emf;
    }

    @AfterClass
    public static void cleanup() {
        EntityManager em = emfs.createEntityManager();
        em.getTransaction().begin();
        em.createNativeQuery("SET REFERENTIAL_INTEGRITY FALSE").executeUpdate();

        em.createNativeQuery("truncate table staff RESTART IDENTITY").executeUpdate();

        em.createNativeQuery("truncate table address RESTART IDENTITY").executeUpdate();

        em.createNativeQuery("truncate table rental RESTART IDENTITY").executeUpdate();

        em.createNativeQuery("truncate table language RESTART IDENTITY").executeUpdate();

        em.createNativeQuery("truncate table customer RESTART IDENTITY").executeUpdate();

        em.createNativeQuery("truncate table film RESTART IDENTITY").executeUpdate();

        em.createNativeQuery("truncate table staff RESTART IDENTITY").executeUpdate();

        em.createNativeQuery("truncate table country RESTART IDENTITY").executeUpdate();

        em.createNativeQuery("truncate table city RESTART IDENTITY").executeUpdate();

        em.createNativeQuery("truncate table inventory RESTART IDENTITY").executeUpdate();
        em.createNativeQuery("SET REFERENTIAL_INTEGRITY TRUE").executeUpdate();
        em.getTransaction().commit();
    }

    public AddressEntity createAddressEntity() {
        if (countAddress > 60) {
            countAddress = 10;
        }

        AddressEntity addressEntity = new AddressEntity();
        addressEntity.setAddress(String.valueOf(relationCount));
        addressEntity.setAddress2(String.valueOf(relationCount));
        addressEntity.setAddressId(relationCount);
        addressEntity.setDistrict(String.valueOf(relationCount));
        addressEntity.setPhone(String.valueOf(relationCount));
        addressEntity.setPostalCode(String.valueOf(relationCount));
        addressEntity.setVersiono(0L);
        relationCount++;
        CityEntity city = createCityEntity();
        addressEntity.setCity(city);
        if (!addressRepository.findAll().contains(addressEntity)) {
            addressEntity = addressRepository.save(addressEntity);
        }
        countAddress++;
        return addressEntity;
    }

    public RentalEntity createRentalEntity() {
        if (countRental > 60) {
            countRental = 10;
        }

        RentalEntity rentalEntity = new RentalEntity();
        rentalEntity.setRentalDate(SearchUtils.stringToDate("19" + countRental + "-09-01 05:25:22"));
        rentalEntity.setRentalId(relationCount);
        rentalEntity.setReturnDate(SearchUtils.stringToDate("19" + countRental + "-09-01 05:25:22"));
        rentalEntity.setVersiono(0L);
        relationCount++;
        InventoryEntity inventory = createInventoryEntity();
        rentalEntity.setInventory(inventory);
        CustomerEntity customer = createCustomerEntity();
        rentalEntity.setCustomer(customer);
        StaffEntity staff = createStaffEntity();
        rentalEntity.setStaff(staff);
        if (!rentalRepository.findAll().contains(rentalEntity)) {
            rentalEntity = rentalRepository.save(rentalEntity);
        }
        countRental++;
        return rentalEntity;
    }

    public LanguageEntity createLanguageEntity() {
        if (countLanguage > 60) {
            countLanguage = 10;
        }

        LanguageEntity languageEntity = new LanguageEntity();
        languageEntity.setLanguageId(relationCount);
        languageEntity.setName(String.valueOf(relationCount));
        languageEntity.setVersiono(0L);
        relationCount++;
        if (!languageRepository.findAll().contains(languageEntity)) {
            languageEntity = languageRepository.save(languageEntity);
        }
        countLanguage++;
        return languageEntity;
    }

    public CustomerEntity createCustomerEntity() {
        if (countCustomer > 60) {
            countCustomer = 10;
        }

        CustomerEntity customerEntity = new CustomerEntity();
        customerEntity.setActive(relationCount);
        customerEntity.setActivebool(false);
        customerEntity.setCustomerId(relationCount);
        customerEntity.setEmail(String.valueOf(relationCount));
        customerEntity.setFirstName(String.valueOf(relationCount));
        customerEntity.setLastName(String.valueOf(relationCount));
        customerEntity.setStoreId((short) relationCount);
        customerEntity.setVersiono(0L);
        relationCount++;
        AddressEntity address = createAddressEntity();
        customerEntity.setAddress(address);
        if (!customerRepository.findAll().contains(customerEntity)) {
            customerEntity = customerRepository.save(customerEntity);
        }
        countCustomer++;
        return customerEntity;
    }

    public FilmEntity createFilmEntity() {
        if (countFilm > 60) {
            countFilm = 10;
        }

        FilmEntity filmEntity = new FilmEntity();
        filmEntity.setDescription(String.valueOf(relationCount));
        filmEntity.setFilmId(relationCount);
        filmEntity.setLength((short) relationCount);
        filmEntity.setRating(String.valueOf(relationCount));
        filmEntity.setReleaseYear(relationCount);
        filmEntity.setRentalDuration((short) relationCount);
        filmEntity.setRentalRate(Double.valueOf(relationCount));
        filmEntity.setReplacementCost(Double.valueOf(relationCount));
        filmEntity.setTitle(String.valueOf(relationCount));
        filmEntity.setVersiono(0L);
        relationCount++;
        LanguageEntity language = createLanguageEntity();
        filmEntity.setLanguage(language);
        if (!filmRepository.findAll().contains(filmEntity)) {
            filmEntity = filmRepository.save(filmEntity);
        }
        countFilm++;
        return filmEntity;
    }

    public StaffEntity createStaffEntity() {
        if (countStaff > 60) {
            countStaff = 10;
        }

        StaffEntity staffEntity = new StaffEntity();
        staffEntity.setActive(false);
        staffEntity.setEmail(String.valueOf(relationCount));
        staffEntity.setFirstName(String.valueOf(relationCount));
        staffEntity.setLastName(String.valueOf(relationCount));
        staffEntity.setPassword(String.valueOf(relationCount));
        staffEntity.setStaffId(relationCount);
        staffEntity.setStoreId((short) relationCount);
        staffEntity.setUsername(String.valueOf(relationCount));
        staffEntity.setVersiono(0L);
        relationCount++;
        AddressEntity address = createAddressEntity();
        staffEntity.setAddress(address);
        if (!staffRepository.findAll().contains(staffEntity)) {
            staffEntity = staffRepository.save(staffEntity);
        }
        countStaff++;
        return staffEntity;
    }

    public CountryEntity createCountryEntity() {
        if (countCountry > 60) {
            countCountry = 10;
        }

        CountryEntity countryEntity = new CountryEntity();
        countryEntity.setCountry(String.valueOf(relationCount));
        countryEntity.setCountryId(relationCount);
        countryEntity.setVersiono(0L);
        relationCount++;
        if (!countryRepository.findAll().contains(countryEntity)) {
            countryEntity = countryRepository.save(countryEntity);
        }
        countCountry++;
        return countryEntity;
    }

    public CityEntity createCityEntity() {
        if (countCity > 60) {
            countCity = 10;
        }

        CityEntity cityEntity = new CityEntity();
        cityEntity.setCity(String.valueOf(relationCount));
        cityEntity.setCityId(relationCount);
        cityEntity.setVersiono(0L);
        relationCount++;
        CountryEntity country = createCountryEntity();
        cityEntity.setCountry(country);
        if (!cityRepository.findAll().contains(cityEntity)) {
            cityEntity = cityRepository.save(cityEntity);
        }
        countCity++;
        return cityEntity;
    }

    public InventoryEntity createInventoryEntity() {
        if (countInventory > 60) {
            countInventory = 10;
        }

        InventoryEntity inventoryEntity = new InventoryEntity();
        inventoryEntity.setInventoryId(relationCount);
        inventoryEntity.setStoreId((short) relationCount);
        inventoryEntity.setVersiono(0L);
        relationCount++;
        FilmEntity film = createFilmEntity();
        inventoryEntity.setFilm(film);
        if (!inventoryRepository.findAll().contains(inventoryEntity)) {
            inventoryEntity = inventoryRepository.save(inventoryEntity);
        }
        countInventory++;
        return inventoryEntity;
    }

    public StaffEntity createEntity() {
        AddressEntity address = createAddressEntity();

        StaffEntity staffEntity = new StaffEntity();
        staffEntity.setActive(false);
        staffEntity.setEmail("1");
        staffEntity.setFirstName("1");
        staffEntity.setLastName("1");
        staffEntity.setPassword("1");
        staffEntity.setStaffId(1);
        staffEntity.setStoreId((short) 1);
        staffEntity.setUsername("1");
        staffEntity.setVersiono(0L);
        staffEntity.setAddress(address);

        return staffEntity;
    }

    public CreateStaffInput createStaffInput() {
        CreateStaffInput staffInput = new CreateStaffInput();
        staffInput.setActive(false);
        staffInput.setEmail("5");
        staffInput.setFirstName("5");
        staffInput.setLastName("5");
        staffInput.setPassword("5");
        staffInput.setStoreId((short) 5);
        staffInput.setUsername("5");

        return staffInput;
    }

    public StaffEntity createNewEntity() {
        StaffEntity staff = new StaffEntity();
        staff.setActive(false);
        staff.setEmail("3");
        staff.setFirstName("3");
        staff.setLastName("3");
        staff.setPassword("3");
        staff.setStaffId(3);
        staff.setStoreId((short) 3);
        staff.setUsername("3");

        return staff;
    }

    public StaffEntity createUpdateEntity() {
        StaffEntity staff = new StaffEntity();
        staff.setActive(false);
        staff.setEmail("4");
        staff.setFirstName("4");
        staff.setLastName("4");
        staff.setPassword("4");
        staff.setStaffId(4);
        staff.setStoreId((short) 4);
        staff.setUsername("4");

        return staff;
    }

    @Before
    public void setup() {
        MockitoAnnotations.initMocks(this);

        final StaffController staffController = new StaffController(
            staffAppService,
            addressAppService,
            paymentAppService,
            rentalAppService,
            storeAppService,
            logHelper,
            env
        );
        when(logHelper.getLogger()).thenReturn(loggerMock);
        doNothing().when(loggerMock).error(anyString());

        this.mvc =
            MockMvcBuilders
                .standaloneSetup(staffController)
                .setCustomArgumentResolvers(sortArgumentResolver)
                .setControllerAdvice()
                .build();
    }

    @Before
    public void initTest() {
        staff = createEntity();
        List<StaffEntity> list = staff_repository.findAll();
        if (!list.contains(staff)) {
            staff = staff_repository.save(staff);
        }
    }

    @Test
    public void FindById_IdIsValid_ReturnStatusOk() throws Exception {
        mvc
            .perform(get("/staff/" + staff.getStaffId() + "/").contentType(MediaType.APPLICATION_JSON))
            .andExpect(status().isOk());
    }

    @Test
    public void FindById_IdIsNotValid_ReturnStatusNotFound() {
        org.assertj.core.api.Assertions
            .assertThatThrownBy(
                () -> mvc.perform(get("/staff/999").contentType(MediaType.APPLICATION_JSON)).andExpect(status().isOk())
            )
            .hasCause(new EntityNotFoundException("Not found"));
    }

    @Test
    public void CreateStaff_StaffDoesNotExist_ReturnStatusOk() throws Exception {
        CreateStaffInput staffInput = createStaffInput();

        AddressEntity address = createAddressEntity();

        staffInput.setAddressId(Integer.parseInt(address.getAddressId().toString()));

        ObjectWriter ow = new ObjectMapper()
            .registerModule(new JavaTimeModule())
            .disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS)
            .writer()
            .withDefaultPrettyPrinter();

        String json = ow.writeValueAsString(staffInput);

        mvc.perform(post("/staff").contentType(MediaType.APPLICATION_JSON).content(json)).andExpect(status().isOk());
    }

    @Test
    public void CreateStaff_addressDoesNotExists_ThrowEntityNotFoundException() throws Exception {
        CreateStaffInput staff = createStaffInput();
        ObjectWriter ow = new ObjectMapper()
            .registerModule(new JavaTimeModule())
            .disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS)
            .writer()
            .withDefaultPrettyPrinter();

        String json = ow.writeValueAsString(staff);

        org.assertj.core.api.Assertions.assertThatThrownBy(
            () ->
                mvc
                    .perform(post("/staff").contentType(MediaType.APPLICATION_JSON).content(json))
                    .andExpect(status().isNotFound())
        );
    }

    @Test
    public void DeleteStaff_IdIsNotValid_ThrowEntityNotFoundException() {
        doReturn(null).when(staffAppService).findById(999);
        org.assertj.core.api.Assertions
            .assertThatThrownBy(
                () ->
                    mvc.perform(delete("/staff/999").contentType(MediaType.APPLICATION_JSON)).andExpect(status().isOk())
            )
            .hasCause(new EntityNotFoundException("There does not exist a staff with a id=999"));
    }

    @Test
    public void Delete_IdIsValid_ReturnStatusNoContent() throws Exception {
        StaffEntity entity = createNewEntity();
        entity.setVersiono(0L);
        AddressEntity address = createAddressEntity();
        entity.setAddress(address);
        entity = staff_repository.save(entity);

        FindStaffByIdOutput output = new FindStaffByIdOutput();
        output.setActive(entity.getActive());
        output.setFirstName(entity.getFirstName());
        output.setLastName(entity.getLastName());
        output.setStaffId(entity.getStaffId());
        output.setStoreId(entity.getStoreId());
        output.setUsername(entity.getUsername());

        Mockito.doReturn(output).when(staffAppService).findById(entity.getStaffId());

        //    Mockito.when(staffAppService.findById(entity.getStaffId())).thenReturn(output);

        mvc
            .perform(delete("/staff/" + entity.getStaffId() + "/").contentType(MediaType.APPLICATION_JSON))
            .andExpect(status().isNoContent());
    }

    @Test
    public void UpdateStaff_StaffDoesNotExist_ReturnStatusNotFound() throws Exception {
        doReturn(null).when(staffAppService).findById(999);

        UpdateStaffInput staff = new UpdateStaffInput();
        staff.setActive(false);
        staff.setEmail("999");
        staff.setFirstName("999");
        staff.setLastName("999");
        staff.setPassword("999");
        staff.setStaffId(999);
        staff.setStoreId((short) 999);
        staff.setUsername("999");

        ObjectWriter ow = new ObjectMapper()
            .registerModule(new JavaTimeModule())
            .disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS)
            .writer()
            .withDefaultPrettyPrinter();
        String json = ow.writeValueAsString(staff);

        org.assertj.core.api.Assertions
            .assertThatThrownBy(
                () ->
                    mvc
                        .perform(put("/staff/999").contentType(MediaType.APPLICATION_JSON).content(json))
                        .andExpect(status().isOk())
            )
            .hasCause(new EntityNotFoundException("Unable to update. Staff with id=999 not found."));
    }

    @Test
    public void UpdateStaff_StaffExists_ReturnStatusOk() throws Exception {
        StaffEntity entity = createUpdateEntity();
        entity.setVersiono(0L);

        AddressEntity address = createAddressEntity();
        entity.setAddress(address);
        entity = staff_repository.save(entity);
        FindStaffByIdOutput output = new FindStaffByIdOutput();
        output.setActive(entity.getActive());
        output.setEmail(entity.getEmail());
        output.setFirstName(entity.getFirstName());
        output.setLastName(entity.getLastName());
        output.setPassword(entity.getPassword());
        output.setStaffId(entity.getStaffId());
        output.setStoreId(entity.getStoreId());
        output.setUsername(entity.getUsername());
        output.setVersiono(entity.getVersiono());

        Mockito.when(staffAppService.findById(entity.getStaffId())).thenReturn(output);

        UpdateStaffInput staffInput = new UpdateStaffInput();
        staffInput.setActive(entity.getActive());
        staffInput.setFirstName(entity.getFirstName());
        staffInput.setLastName(entity.getLastName());
        staffInput.setStaffId(entity.getStaffId());
        staffInput.setStoreId(entity.getStoreId());
        staffInput.setUsername(entity.getUsername());

        staffInput.setAddressId(Integer.parseInt(address.getAddressId().toString()));

        ObjectWriter ow = new ObjectMapper()
            .registerModule(new JavaTimeModule())
            .disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS)
            .writer()
            .withDefaultPrettyPrinter();
        String json = ow.writeValueAsString(staffInput);

        mvc
            .perform(put("/staff/" + entity.getStaffId() + "/").contentType(MediaType.APPLICATION_JSON).content(json))
            .andExpect(status().isOk());

        StaffEntity de = createUpdateEntity();
        de.setStaffId(entity.getStaffId());
        staff_repository.delete(de);
    }

    @Test
    public void FindAll_SearchIsNotNullAndPropertyIsValid_ReturnStatusOk() throws Exception {
        mvc
            .perform(get("/staff?search=staffId[equals]=1&limit=10&offset=1").contentType(MediaType.APPLICATION_JSON))
            .andExpect(status().isOk());
    }

    @Test
    public void FindAll_SearchIsNotNullAndPropertyIsNotValid_ThrowException() throws Exception {
        org.assertj.core.api.Assertions
            .assertThatThrownBy(
                () ->
                    mvc
                        .perform(
                            get("/staff?search=staffstaffId[equals]=1&limit=10&offset=1")
                                .contentType(MediaType.APPLICATION_JSON)
                        )
                        .andExpect(status().isOk())
            )
            .hasCause(new Exception("Wrong URL Format: Property staffstaffId not found!"));
    }

    @Test
    public void GetAddress_IdIsNotEmptyAndIdDoesNotExist_ReturnNotFound() {
        org.assertj.core.api.Assertions
            .assertThatThrownBy(
                () ->
                    mvc
                        .perform(get("/staff/999/address").contentType(MediaType.APPLICATION_JSON))
                        .andExpect(status().isOk())
            )
            .hasCause(new EntityNotFoundException("Not found"));
    }

    @Test
    public void GetAddress_searchIsNotEmptyAndPropertyIsValid_ReturnList() throws Exception {
        mvc
            .perform(get("/staff/" + staff.getStaffId() + "/address").contentType(MediaType.APPLICATION_JSON))
            .andExpect(status().isOk());
    }

    @Test
    public void GetPayments_searchIsNotEmptyAndPropertyIsNotValid_ThrowException() {
        Map<String, String> joinCol = new HashMap<String, String>();
        joinCol.put("staffId", "1");

        Mockito.when(staffAppService.parsePaymentsJoinColumn("staffid")).thenReturn(joinCol);
        org.assertj.core.api.Assertions
            .assertThatThrownBy(
                () ->
                    mvc
                        .perform(
                            get("/staff/1/payments?search=abc[equals]=1&limit=10&offset=1")
                                .contentType(MediaType.APPLICATION_JSON)
                        )
                        .andExpect(status().isOk())
            )
            .hasCause(new Exception("Wrong URL Format: Property abc not found!"));
    }

    @Test
    public void GetPayments_searchIsNotEmptyAndPropertyIsValid_ReturnList() throws Exception {
        Map<String, String> joinCol = new HashMap<String, String>();
        joinCol.put("staffId", "1");

        Mockito.when(staffAppService.parsePaymentsJoinColumn("staffId")).thenReturn(joinCol);
        mvc
            .perform(
                get("/staff/1/payments?search=staffId[equals]=1&limit=10&offset=1")
                    .contentType(MediaType.APPLICATION_JSON)
            )
            .andExpect(status().isOk());
    }

    @Test
    public void GetPayments_searchIsNotEmpty() {
        Mockito.when(staffAppService.parsePaymentsJoinColumn(anyString())).thenReturn(null);

        org.assertj.core.api.Assertions
            .assertThatThrownBy(
                () ->
                    mvc
                        .perform(
                            get("/staff/1/payments?search=staffId[equals]=1&limit=10&offset=1")
                                .contentType(MediaType.APPLICATION_JSON)
                        )
                        .andExpect(status().isOk())
            )
            .hasCause(new EntityNotFoundException("Invalid join column"));
    }

    @Test
    public void GetRentals_searchIsNotEmptyAndPropertyIsNotValid_ThrowException() {
        Map<String, String> joinCol = new HashMap<String, String>();
        joinCol.put("staffId", "1");

        Mockito.when(staffAppService.parseRentalsJoinColumn("staffid")).thenReturn(joinCol);
        org.assertj.core.api.Assertions
            .assertThatThrownBy(
                () ->
                    mvc
                        .perform(
                            get("/staff/1/rentals?search=abc[equals]=1&limit=10&offset=1")
                                .contentType(MediaType.APPLICATION_JSON)
                        )
                        .andExpect(status().isOk())
            )
            .hasCause(new Exception("Wrong URL Format: Property abc not found!"));
    }

    @Test
    public void GetRentals_searchIsNotEmptyAndPropertyIsValid_ReturnList() throws Exception {
        Map<String, String> joinCol = new HashMap<String, String>();
        joinCol.put("staffId", "1");

        Mockito.when(staffAppService.parseRentalsJoinColumn("staffId")).thenReturn(joinCol);
        mvc
            .perform(
                get("/staff/1/rentals?search=staffId[equals]=1&limit=10&offset=1")
                    .contentType(MediaType.APPLICATION_JSON)
            )
            .andExpect(status().isOk());
    }

    @Test
    public void GetRentals_searchIsNotEmpty() {
        Mockito.when(staffAppService.parseRentalsJoinColumn(anyString())).thenReturn(null);

        org.assertj.core.api.Assertions
            .assertThatThrownBy(
                () ->
                    mvc
                        .perform(
                            get("/staff/1/rentals?search=staffId[equals]=1&limit=10&offset=1")
                                .contentType(MediaType.APPLICATION_JSON)
                        )
                        .andExpect(status().isOk())
            )
            .hasCause(new EntityNotFoundException("Invalid join column"));
    }

    @Test
    public void GetStores_searchIsNotEmptyAndPropertyIsNotValid_ThrowException() {
        Map<String, String> joinCol = new HashMap<String, String>();
        joinCol.put("staffId", "1");

        Mockito.when(staffAppService.parseStoresJoinColumn("managerstaffid")).thenReturn(joinCol);
        org.assertj.core.api.Assertions
            .assertThatThrownBy(
                () ->
                    mvc
                        .perform(
                            get("/staff/1/stores?search=abc[equals]=1&limit=10&offset=1")
                                .contentType(MediaType.APPLICATION_JSON)
                        )
                        .andExpect(status().isOk())
            )
            .hasCause(new Exception("Wrong URL Format: Property abc not found!"));
    }

    @Test
    public void GetStores_searchIsNotEmptyAndPropertyIsValid_ReturnList() throws Exception {
        Map<String, String> joinCol = new HashMap<String, String>();
        joinCol.put("staffId", "1");

        Mockito.when(staffAppService.parseStoresJoinColumn("managerStaffId")).thenReturn(joinCol);
        mvc
            .perform(
                get("/staff/1/stores?search=managerStaffId[equals]=1&limit=10&offset=1")
                    .contentType(MediaType.APPLICATION_JSON)
            )
            .andExpect(status().isOk());
    }

    @Test
    public void GetStores_searchIsNotEmpty() {
        Mockito.when(staffAppService.parseStoresJoinColumn(anyString())).thenReturn(null);

        org.assertj.core.api.Assertions
            .assertThatThrownBy(
                () ->
                    mvc
                        .perform(
                            get("/staff/1/stores?search=managerStaffId[equals]=1&limit=10&offset=1")
                                .contentType(MediaType.APPLICATION_JSON)
                        )
                        .andExpect(status().isOk())
            )
            .hasCause(new EntityNotFoundException("Invalid join column"));
    }
}
