package org.hydra.default_template.utils;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CalculatorTest {

    private Calculator calculator;

    @BeforeEach
    public void init() {
        calculator = new Calculator();
    }

    @Test
    public void addTwoNumbers() {
        assertEquals(16, calculator.add(7, 9));
    }

    @Test
    public void addOverflowException() {
        var exception = assertThrows(ArithmeticException.class, () -> calculator.add(Integer.MAX_VALUE, 5));
        assertEquals("integer overflow", exception.getMessage());
    }

    @Test
    public void subTwoNumbers() {
        assertEquals(9, calculator.subtract(18, 9));
    }

    @Test
    public void subUnderflowException() {
        var exception = assertThrows(ArithmeticException.class, () -> calculator.subtract(Integer.MIN_VALUE, 3));
        assertEquals("integer overflow", exception.getMessage());
    }

    @Test
    public void multiplyTwoNumbers() {
        assertEquals(64, calculator.multiply(8, 8));
    }

    @Test
    public void multiplyOverflowException() {
        var exception = assertThrows(ArithmeticException.class, () -> calculator.multiply(8, Integer.MAX_VALUE));
        assertEquals("integer overflow", exception.getMessage());
    }

    @Test
    public void divideTwoNumbers() {
        assertEquals(8, calculator.divide(24, 3));
    }

    @Test
    public void divideByZeroException() {
        var exception = assertThrows(ArithmeticException.class, () -> calculator.divide(9, 0));
        assertEquals("/ by zero", exception.getMessage());
    }

}
