import com.config.eaps.controllers.MainController;
import org.junit.Before;
import org.junit.Test;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;

/**
 * Created by dean on 10/16/15.
 */
public class ControllerTest {

    MainController controller;
    MockMvc mock;

    @Before
    public void init() {
        controller = new MainController();
        mock = standaloneSetup(controller).build();
    }

    @Test
    public void testMainPage() throws Exception {
        mock.perform(get("/")).andExpect(view().name("index"));
    }

    @Test
    public void testHello() throws Exception {
        mock.perform(get("/dean")).andExpect(view().name("hello"));
    }
}
