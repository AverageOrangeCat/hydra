package GROUP_ID.ARTIFACT_ID.PROJECT_NAME.utils;

public class Calculator {

    public Integer add(Integer number1, Integer number2) {
        return Math.addExact(number1, number2);
    }

    public Integer subtract(Integer number1, Integer number2) {
        return Math.subtractExact(number1, number2);
    }

    public Integer multiply(Integer number1, Integer number2) {
        return Math.multiplyExact(number1, number2);
    }

    public Integer divide(Integer number1, Integer number2) {
        return Math.divideExact(number1, number2);
    }

}
