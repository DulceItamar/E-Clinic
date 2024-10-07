//
//  ConditionsAndTermView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/10/24.
//

import SwiftUI

struct ConditionsAndTermView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                Text("Última actualización: 06/octubre/2024")
                    .font(.subheadline)
                    .padding(.bottom, 10)
                
                Text("Bienvenido/a a E-Connect, una plataforma diseñada para facilitar consultas médicas a distancia entre pacientes y profesionales de la salud. Al descargar y utilizar nuestra aplicación, aceptas estos Términos y Condiciones. Por favor, léelos detenidamente antes de utilizar nuestros servicios.")
                
                Text(" Si no estás de acuerdo con estos términos, no utilices la Aplicación.")
                    .padding(.bottom, 10)
                
                Text("1. Definiciones")
                    .font(.title2)
                    .bold()
                
                
                Text("""
                "Aplicación" se refiere a la aplicación móvil de [Nombre de la App] y a cualquier otro servicio relacionado con consultas médicas que ofrecemos.
                "Usuario" se refiere a cualquier persona que descargue, instale o utilice la Aplicación.
                "Profesionales Médicos" se refiere a los doctores, especialistas, o personal sanitario que ofrece consultas a través de la Aplicación.
                
                """)
                .padding(.bottom, 10)
                
            }
            
            VStack(alignment: .leading){
                
                Text("2. Uso de la aplicación")
                    .font(.title2)
                    .bold()
                
                Text("2.1 Registro de cuenta")
                    .font(.title3)
                
                Text("Para utilizar nuestros servicios, deberás crear una cuenta proporcionando información veraz y completa. Eres responsable de mantener la confidencialidad de tu cuenta y contraseña, así como de todas las actividades que ocurran bajo tu cuenta.")
                    .padding(.bottom, 5)
                
                
                Text("2.2 Edad miníma")
                    .font(.title3)
                
                Text("Debes tener al menos 18 años de edad o contar con el permiso de un tutor legal para utilizar esta Aplicación. Si eres menor de edad, la cuenta debe ser creada y gestionada por un padre o tutor.")
                    .padding(.bottom, 5)
                
                Text("2.3 Servicios ofrecidos")
                        .font(.title3)
                
                Text("""
                La Aplicación permite a los usuarios:

                - Realizar consultas médicas en línea con Profesionales Médicos.
                - Acceder a historiales médicos y prescripciones digitales.
                - Programar citas y recibir notificaciones sobre consultas.
                """)
                .padding(.bottom, 10)
                
               
            }
            
            VStack(alignment: .leading) {
                Text("3 Limitaciones de los Servicios Médicos")
                    .font(.title2)
                    .bold()
                
                Text("""
                - La consulta a través de la Aplicación no puede reemplazar una visita física en caso de emergencia médica. Si experimentas una emergencia médica, debes contactar a los servicios de emergencia o acudir a un centro de atención médica.
                - Los profesionales que brindan consultas a través de la Aplicación son independientes y responsables de las recomendaciones y tratamientos ofrecidos. La Aplicación no es responsable por las acciones de los profesionales médicos.
                """)
                .padding(.bottom, 10)
                
                Text("4. Costos y Pagos")
                    .font(.title2)
                    .bold()
                
                Text("4.1 Tarifas")
                            .font(.title3)
                
                Text("El uso de la Aplicación para acceder a consultas médicas puede estar sujeto a tarifas. Al utilizar nuestros servicios, aceptas pagar las tarifas correspondientes, que serán indicadas en la Aplicación antes de completar el proceso de consulta.")
                    .padding(.bottom, 5)
            }
            
            
            
            VStack(alignment: .leading){
                
               
                                  
                Text("4.2 Pagos")
                                .font(.title3)
                
                Text("Los pagos se procesan a través de terceros proveedores de servicios de pago. Nos reservamos el derecho de cambiar nuestras tarifas en cualquier momento. Te notificaremos cualquier cambio antes de que se apliquen")
                    .padding(.bottom, 5)
                                      
                Text("4.3 Reembolsos")
                                    .font(.title3)
                
                Text("Los reembolsos solo se aplicarán de acuerdo con nuestra política de reembolsos, disponible en la sección de [Política de Reembolsos]. En caso de insatisfacción, puedes ponerte en contacto con nuestro equipo de soporte.")
                    .padding(.bottom, 5)
                
            }
            
            VStack(alignment: .leading) {
                Text("5. Uso aceptable")
                    .font(.title2)
                    .bold()
                
                Text("""
                Al utilizar nuestra Aplicación, te comprometes a:

                - No utilizar la Aplicación con fines ilegales, fraudulentos o para causar daño a otros.
                - No intentar hackear, modificar o distribuir partes de la Aplicación.
                - No utilizar la identidad de otra persona o proporcionar información falsa.
                """)
                
                Text("Nos reservamos el derecho de suspender o cancelar tu cuenta si violas estas reglas de uso.")
                
                Text("6. Propiedad Intelectual")
                    .font(.title2)
                    .bold()
                
                
                Text("6.1 Derechos de Propiedad").font(.title3)
                
                Text("Todos los contenidos disponibles en la Aplicación, incluyendo textos, imágenes, gráficos, logotipos, íconos, y software, son propiedad de [Nombre de la Empresa] o de terceros, y están protegidos por leyes de propiedad intelectual.")
                
                Text("6.2 Licencia Limitada").font(.title3)
                
                Text("Te concedemos una licencia limitada, no exclusiva e intransferible para utilizar la Aplicación de acuerdo con estos Términos y Condiciones. No tienes derecho a modificar, distribuir, vender o revender el contenido o software de la Aplicación.")
                
            }
            
            
            VStack(alignment: .leading) {
                Text("7 Exepción de responsabilidad")
                    .font(.title2)
                    .bold()
                
                Text("7.1 Servicios médicos").font(.title3)
                
                Text("La Aplicación facilita la comunicación entre los usuarios y profesionales médicos, pero no ofrece directamente servicios médicos ni se hace responsable por los consejos o tratamientos brindados por los profesionales. Cualquier diagnóstico, tratamiento o recomendación es responsabilidad exclusiva del profesional de salud que te atienda.")
                
                Text("7.2 Exepción de garantías").font(.title3)
                
                Text("El uso de la Aplicación es bajo tu propio riesgo. Proporcionamos la Aplicación tal cual y no ofrecemos garantías explícitas o implícitas de ningún tipo, incluyendo, pero no limitadas a, garantías de comerciabilidad o idoneidad para un propósito particular.")
                
                Text("8. Limitación de Responsabilidad")
                    .font(.title2)
                    .bold()
                
                Text("En ningún caso Connect S.A. de C.V. será responsable por daños indirectos, incidentales, especiales o consecuentes que resulten del uso o la incapacidad de utilizar la Aplicación. Esto incluye, pero no se limita a, pérdidas de ingresos, datos o reputación.")
                    .padding(.bottom, 5)
                
               
            }
            
            VStack(alignment: .leading) {
                
                Text("9. Modificaciones de los Términos")
                    .font(.title2)
                    .bold()
                
                Text("Nos reservamos el derecho de modificar estos Términos y Condiciones en cualquier momento. Te notificaremos de los cambios importantes a través de la Aplicación o por correo electrónico. El uso continuo de la Aplicación tras la modificación de los términos implicará que aceptas las actualizaciones.")
                    .padding(.bottom, 10)
                
                Text("10. Terminación")
                    .font(.title2)
                    .bold()
                
                Text("Podemos suspender o cancelar tu acceso a la Aplicación en cualquier momento si creemos que has violado estos Términos y Condiciones. También tienes el derecho de eliminar tu cuenta en cualquier momento, pero debes cumplir con todas las obligaciones de pago pendientes.")
                    .padding(.bottom, 10)
            }
        }
        .padding()
        .toolbarBackground(.main, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle("Términos y condiciones")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ConditionsAndTermView()
}
