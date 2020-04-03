package ink.unicode.xin.generator.exception;

/**
 * Created by fjx on 2020/04/01 00:00
 */
public class CodeGenerateException extends RuntimeException {

    public CodeGenerateException(String msg) {
        super(msg);
    }

    public CodeGenerateException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public CodeGenerateException(Throwable cause) {
        super(cause);
    }

}
