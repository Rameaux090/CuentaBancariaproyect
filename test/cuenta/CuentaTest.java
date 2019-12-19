/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cuenta;

import junit.framework.TestCase;

/**
 *
 * @author cRasS
 */
public class CuentaTest extends TestCase {
    
    public CuentaTest(String testName) {
        super(testName);
    }
    
    @Override
    protected void setUp() throws Exception {
        super.setUp();
    }
    
    @Override
    protected void tearDown() throws Exception {
        super.tearDown();
    }

    /**
     * Test of ingresar method, of class Cuenta.
     * * @throws java.lang.Exception
     */
    
    public void testIngresar() throws Exception {
        System.out.println("ingresar");
        double cantidad = 4000.0;
        Cuenta miCuenta = new Cuenta("Antonio Sánchez","1000-2365-85-123456799",3500,0);
        miCuenta.ingresar(cantidad);
        assertTrue(miCuenta.estado()==7500);
    }

    public void testIngresar2() throws Exception {
        System.out.println("ingresar");
        double cantidad = 900.0;
        Cuenta miCuenta = new Cuenta("Antonio Sánchez","1000-2365-85-123456799",4500,0);
        miCuenta.ingresar(cantidad);
                
        try {
          miCuenta.ingresar(cantidad);
          fail("Intento de ingresar un numero negativo de euros");
        } catch (Exception e){
        System.out.println(e);
            assertTrue(miCuenta.estado()==4500);
                 
         }
        }
     
    }
   
    
    /**
     * Test of retirar method, of class Cuenta.
     */
   

