package ink.unicode.xin.generator.service;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;

/**
 * Created by fjx on 2020/04/01 00:00
 */
@Service
public class FreemarkerService {

    @Autowired
    private Configuration configuration;

    /**
     * process Template Into String
     */
    public String processTemplateIntoString(Template template, Object model)
            throws IOException, TemplateException {

        StringWriter result = new StringWriter();
        template.process(model, result);
        return result.toString();
    }

    /**
     * process String
     */
    public String processString(String templateName, Map<String, Object> params)
            throws IOException, TemplateException {

        Template template = configuration.getTemplate(templateName);
        String htmlText = processTemplateIntoString(template, params);
        return htmlText;
    }
}
