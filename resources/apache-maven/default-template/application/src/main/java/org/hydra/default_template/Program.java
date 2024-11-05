package org.hydra.default_template;

import org.hydra.default_template.utils.Calculator;

public class Program {

    public static void main(String[] args) {
        var calculator = new Calculator();

        System.out.println("1 + 2 = " + calculator.add(1, 2));
        System.out.println("5 - 3 = " + calculator.subtract(5, 3));
        System.out.println("2 * 4 = " + calculator.multiply(2, 4));
        System.out.println("8 * 4 = " + calculator.divide(8, 2));
    }

}
