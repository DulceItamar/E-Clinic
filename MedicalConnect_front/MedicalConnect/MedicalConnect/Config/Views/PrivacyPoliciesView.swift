//
//  PrivacyPoliciesView.swift
//  MedicalConnect
//
//  Created by Dulce Itamar Vigueras Ballesteros on 02/10/24.
//

import SwiftUI

struct PrivacyPoliciesView: View {
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading) {
                Text("Última actualización: 06/octubre/2024")
                    .font(.subheadline)
                    .padding(.bottom, 10)
                
                Text("En E-Connect, nos comprometemos a proteger la privacidad de nuestros usuarios. Esta política de privacidad describe cómo recopilamos, utilizamos, compartimos y protegemos tu información personal cuando utilizas nuestra aplicación de consultas médicas. Al utilizar la aplicación, aceptas los términos de esta política.")
                    .padding(.bottom, 10)
                
                Text("1. Información que Recopilamos")
                    .font(.title2)
                    .bold()
                
                Text("1.1 Información Personal")
                    .font(.title3)
                    
                
                Text(" Cuando te registras en nuestra aplicación o utilizas nuestros servicios, podemos recopilar la siguiente información:")
                    .padding(.bottom, 5)
                
                Text("""
                 - Nombre completo
                 - Dirección de correo electrónico
                 - Número de teléfono
                 - Información médica: historial médico, síntomas, diagnósticos, recetas y resultados de pruebas.
                 - Datos de pago: información de tarjeta de crédito o cuenta bancaria para procesar pagos.
                """)
                .padding(.bottom, 10)
                
                Text("1.2 Información Técnica ")
                    .font(.title3)
                
                Text("Recopilamos automáticamente ciertos datos técnicos cuando accedes a la aplicación, tales como:")
                    .padding(.bottom, 5)
                
                Text("""
                - Dirección IP
                - Tipo de dispositivo y sistema operativo
                - Datos de uso: páginas visitadas, tiempo de uso, clics y preferencias.
                """)
                .padding(.bottom, 10)
                
            }
            
            VStack(alignment: .leading) {
                
                Text("2. Cómo usamos tu información")
                    .font(.title2)
                    .bold()
                
                Text("La información que recopilamos se utiliza para los siguientes fines:")
                    .padding(.bottom, 5)
                
                Text("""
                - Proveer servicios médicos: Facilitar consultas entre los usuarios y los profesionales médicos.
                - Comunicación: Enviar notificaciones y actualizaciones sobre citas, resultados de pruebas, etc.
                - Mejorar la aplicación: Monitorear el uso para mejorar la experiencia del usuario y optimizar nuestro servicio.
                - Procesar pagos: Gestionar transacciones financieras.
                - Cumplimiento de leyes: Cumplir con las normativas legales y regulaciones aplicables.
                """)
                .padding(.bottom, 10)
                
                Text("3. Cómo compartimos tu información")
                    .font(.title2)
                    .bold()
                
                Text("Compartimos tu información solo en los siguientes casos:")
                    .padding(.bottom, 5)
                
                Text("""
                - Profesionales médicos: Compartimos tu información médica con los profesionales de salud que consultes a través de la aplicación para brindarte el mejor servicio posible.
                - Proveedores de servicios: Terceros que nos asisten en la operación de la aplicación, como procesadores de pagos o proveedores de servicios de almacenamiento en la nube.
                - Cumplimiento legal: Podremos divulgar tu información si así lo requiere la ley, como en el caso de citaciones judiciales o investigaciones regulatorias
                """)
                .padding(.bottom, 10)
                
                Text("4. Seguridad de la Información")
                    .font(.title2)
                    .bold()
                
                Text("Nos tomamos muy en serio la seguridad de tu información personal. Utilizamos medidas técnicas y organizativas para proteger tus datos contra el acceso no autorizado, pérdida o divulgación, tales como:")
                    .padding(.bottom, 5)
                
                Text("""
                - Cifrado de datos: Los datos médicos y personales se cifran tanto en tránsito como en reposo.
                - Control de acceso: Solo el personal autorizado puede acceder a la información confidencial.
                - Autenticación: Implementamos autenticación de dos factores (2FA) para asegurar el acceso a las cuentas.
                """)
                .padding(.bottom, 10)
            }
            
            VStack(alignment: .leading) {
                
                Text("5. Tus Derechos")
                    .font(.title2)
                    .bold()
                
                Text("Tienes ciertos derechos en relación con tu información personal, incluyendo:")
                    .padding(.bottom, 5)
                
                Text("""
                - Acceso: Puedes solicitar acceso a los datos personales que tenemos sobre ti.
                - Rectificación: Puedes corregir cualquier información incorrecta o incompleta.
                - Eliminación: Puedes solicitar la eliminación de tus datos, siempre que no estemos obligados a retenerlos por motivos legales o regulatorios.
                - Portabilidad: Puedes solicitar una copia de tus datos en un formato legible.
                - Revocación de consentimiento: Puedes retirar tu consentimiento para el uso de tus datos en cualquier momento.
                """)
                .padding(.bottom, 10)
                
                
                Text("6. Almacenamiento de Datos")
                    .font(.title2)
                    .bold()
                
                Text("Conservamos tu información solo durante el tiempo necesario para cumplir los fines descritos en esta política, o según lo exija la ley. Cuando ya no sea necesario, tus datos serán eliminados o anonimizados de manera segura.")
                    .padding(.bottom, 10)
                
                Text("7. Cookies y Tecnologías Similares")
                    .font(.title2)
                    .bold()
                
                Text("Utilizamos cookies y otras tecnologías de seguimiento para mejorar la funcionalidad de la aplicación y ofrecerte una experiencia personalizada. Puedes controlar el uso de cookies a través de la configuración de tu dispositivo o navegador.")
                    .padding(.bottom, 10)
                
                
                Text("8. Cambios en la Política de Privacidad")
                    .font(.title2)
                    .bold()
                
                Text("Podemos actualizar esta política de privacidad en cualquier momento para reflejar cambios en nuestras prácticas o por razones legales. Te notificaremos sobre cualquier cambio importante a través de la aplicación o por correo electrónico.")
                    .padding(.bottom, 10)
                
            }
           
        }
        .padding()
        .toolbarBackground(.main, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationTitle("Privacidad")
    }
}

#Preview {
    PrivacyPoliciesView()
}
