//
//  ValidacionController.swift
//  pizzaWatch WatchKit Extension
//
//  Created by Vicente Ordoñez Garcia on 11/11/18.
//  Copyright © 2018 Vicente Ordoñez Garcia. All rights reserved.
//

import WatchKit
import Foundation


class ValidacionController: WKInterfaceController {
    var pizzaCtx : Pizza = Pizza(tam: "")
    @IBOutlet weak var lblValidacion: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        pizzaCtx = context as! Pizza
        
         let orden : String = "Ha seleccionado una pizza \(pizzaCtx.tamanio) con tipo de masa \(pizzaCtx.masa), tipo de queso \(pizzaCtx.queso), ingredientes: \(pizzaCtx.ingredientes)."
        
        lblValidacion.setText(orden)
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func cancelarOrden() {
        popToRootController()
    }
    @IBAction func confrimarOrden() {
        if pizzaCtx.tamanio == ""
        {
            lblValidacion.setText("Falta que seleccione el tamaño de la pizza para poder confirmar  su orden")
            let action1 = WKAlertAction.init(title: "OK", style: .default, handler: { () -> Void in self.NavegarA(controllerName: "TamanioView") })
            
            presentAlert(withTitle: "Pizza App", message: "No ha seleccionado el tamaño de la pizza", preferredStyle: .alert, actions: [action1])
        }
        else if pizzaCtx.masa == "" {
            lblValidacion.setText("Falta que seleccione el tipo de masa de la pizza para poder confirmar su orden")
            let action1 = WKAlertAction.init(title: "OK", style: .default, handler: { () -> Void in self.NavegarA(controllerName: "masaView") })
            
            presentAlert(withTitle: "Pizza App", message: "No ha seleccionado el tipo de masa", preferredStyle: .alert, actions: [action1])
        }
        else if pizzaCtx.queso == "" {
            lblValidacion.setText("Falta que seleccione el tipo de queso de la pizza para poder confirmar su orden")
            let action1 = WKAlertAction.init(title: "OK", style: .default, handler: { () -> Void in self.NavegarA(controllerName: "quesoView") })
            
            presentAlert(withTitle: "Pizza App", message: "No ha seleccionado el tipo de queso", preferredStyle: .alert, actions: [action1])
        }
        else if pizzaCtx.ingredientes == "" {
            lblValidacion.setText("Falta que seleccione al menos un ingrediente para confirmar su orden")
            let action1 = WKAlertAction.init(title: "OK", style: .default, handler: { () -> Void in self.NavegarA(controllerName: "IngredientesView")})
            
            presentAlert(withTitle: "Pizza App", message: "Debe seleccionar al menos un ingrediente", preferredStyle: .alert, actions: [action1])
        }
        else {
            //pushController(withName: "ConfirmView", context: pizzaCtx)
            //presentController(withName: "ConfirmView", context: pizzaCtx)
            let action1 = WKAlertAction.init(title: "OK", style: .default, handler: { () -> Void in self.NuevaOrden()  })
            
            presentAlert(withTitle: "Pizza App", message: "Su orden ha sido tomada", preferredStyle: .alert, actions: [action1])
        }
        
    }
    
    func NuevaOrden() {
        self.popToRootController()
    }
    
    func NavegarA(controllerName : String) {
        self.pushController(withName: controllerName, context: self.pizzaCtx)
    }
}
