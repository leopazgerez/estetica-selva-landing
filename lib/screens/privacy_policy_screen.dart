import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    return Scaffold(
      appBar: const Navbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Banner
            Container(
              width: double.infinity,
              color: AppTheme.primarySubtle,
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 36 : 56,
                horizontal: 24,
              ),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: AppTheme.contentMaxWidth(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryGreen,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.security, color: Colors.white, size: 14),
                            SizedBox(width: 6),
                            Text(
                              'DOCUMENTO OFICIAL',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Políticas de Privacidad',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: AppTheme.primaryDark,
                              fontSize: isMobile ? 30 : 42,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Aplicación móvil y plataforma "Selva Estética"',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppTheme.primaryLight,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Icon(Icons.update, size: 16, color: AppTheme.textSecondary),
                          SizedBox(width: 6),
                          Text(
                            'Última actualización: Septiembre 2026 | Conforme a requerimientos de Google Play y Google Cloud',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Content Body
            Container(
              color: AppTheme.backgroundWarm,
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 32 : 56,
                horizontal: 24,
              ),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 860),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppTheme.borderLight),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(isMobile ? 24 : 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Notice Box for Google Reviewers
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppTheme.accentMint.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppTheme.primaryGreen.withValues(alpha: 0.3)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(Icons.verified_user, color: AppTheme.primaryGreen, size: 24),
                            SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Compromiso de Privacidad y Verificación de Google',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: AppTheme.primaryDark,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    'Selva Estética respeta plenamente su privacidad y garantiza que la recopilación de datos se limita estrictamente a la prestación de servicios de gestión de turnos y pacientes dentro del centro estético.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppTheme.textPrimary,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),

                      _buildSectionTitle(context, '1. Información del Responsable'),
                      _buildParagraph(
                        'La aplicación móvil y el sistema de gestión "Selva Estética" (en adelante, "la Aplicación" o "el Servicio") es operado y administrado con el compromiso de proteger la información confidencial de profesionales de la estética y sus respectivos pacientes.\n\n'
                        'Para cualquier duda, aclaración o solicitud relacionada con este documento, puede contactar al Delegado de Protección de Datos a través de: soporte@esteticaselva.com.',
                      ),

                      _buildSectionTitle(context, '2. Información que Recopilamos'),
                      _buildParagraph(
                        'Selva Estética recopila únicamente la información necesaria para el correcto funcionamiento del software de gestión estética:\n\n'
                        '• Datos de Identificación de Pacientes: Nombre completo, fecha de nacimiento, domicilio, ocupación y número de teléfono.\n'
                        '• Datos de Contacto de Emergencia: Nombre y teléfono de familiares o allegados ante eventualidades durante los tratamientos.\n'
                        '• Información de Citas y Turnos: Fechas, horarios, tipo de tratamiento seleccionado (limpieza facial, tratamientos corporales, masajes, etc.) y notas de evolución estética.\n'
                        '• Información de Autenticación de Usuario: Nombre de usuario, dirección de correo electrónico e identificador de cuenta proporcionado mediante Google Sign-In (cuando el profesional decide iniciar sesión con su cuenta de Google).',
                      ),

                      _buildSectionTitle(context, '3. Cumplimiento de la Política de Datos de Usuario de Google (Google API User Data Policy)'),
                      _buildParagraph(
                        'Si la Aplicación accede a datos de cuentas de Google (mediante Google Sign-In o Google Calendar para sincronización de turnos):\n\n'
                        '• Uso Limitado (Limited Use): El uso y la transferencia a cualquier otra aplicación de la información recibida de las API de Google por parte de Selva Estética se adherirán estrictamente a la Política de Datos de Usuario de los Servicios de las API de Google, incluidos los requisitos de Uso Limitado.\n'
                        '• No Comercialización: En ningún caso los datos de usuario de Google se comercializan, venden o transfieren a redes publicitarias, corredores de datos ni terceros para fines de marketing o publicidad.\n'
                        '• Acceso Restringido: Únicamente el personal técnico autorizado podrá acceder a registros anónimos en caso de depuración de errores críticos.',
                      ),

                      _buildSectionTitle(context, '4. Finalidad del Tratamiento de los Datos'),
                      _buildParagraph(
                        'La información recopilada se destina de forma exclusiva a:\n\n'
                        '1. Permitir la creación, consulta y actualización de la ficha clínica/estética del paciente.\n'
                        '2. Gestionar la agenda diaria, semanal y mensual de turnos y sesiones de belleza.\n'
                        '3. Proveer soporte técnico y asegurar la estabilidad y seguridad de la plataforma.',
                      ),

                      _buildSectionTitle(context, '5. Seguridad y Almacenamiento de la Información'),
                      _buildParagraph(
                        'Adoptamos medidas de seguridad técnicas, organizativas y físicas para resguardar la confidencialidad de los datos:\n\n'
                        '• Transmisión cifrada de extremo a extremo mediante protocolos seguros TLS/HTTPS.\n'
                        '• Controles estrictos de acceso basados en credenciales protegidas.\n'
                        '• Copias de seguridad periódicas cifradas en servidores seguros.',
                      ),

                      _buildSectionTitle(context, '6. Derechos del Usuario y Proceso de Eliminación de Datos (Data Deletion Request)'),
                      _buildParagraph(
                        'De acuerdo con las normativas internacionales de protección de datos y las directrices de Google Play, usted tiene el derecho irrevocable de acceder, rectificar, limitar o solicitar la eliminación total de su cuenta y de todos los datos asociados.',
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppTheme.primarySubtle,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppTheme.borderLight),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '¿Cómo solicitar el borrado de sus datos?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppTheme.primaryDark,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '1. Envíe un correo electrónico a: soporte@esteticaselva.com con el asunto "Solicitud de Eliminación de Datos - Selva Estética".\n'
                              '2. Indique el correo electrónico con el que está registrado en la aplicación.\n'
                              '3. Nuestro equipo confirmará la recepción y ejecutará la eliminación permanente e irreversible de sus registros y pacientes asociados en un plazo máximo de 72 horas hábiles.',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppTheme.textPrimary,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),

                      _buildSectionTitle(context, '7. Modificaciones a esta Política'),
                      _buildParagraph(
                        'Selva Estética se reserva el derecho de actualizar esta política para reflejar mejoras en la aplicación o cambios regulatorios. Cualquier cambio sustancial será publicado en esta misma página web con la fecha de revisión actualizada.',
                      ),

                      _buildSectionTitle(context, '8. Contacto'),
                      _buildParagraph(
                        'Si tiene preguntas o inquietudes sobre esta Política de Privacidad o las prácticas de privacidad de Selva Estética, por favor contáctenos:\n\n'
                        '• Correo Electrónico: soporte@esteticaselva.com\n'
                        '• Web Oficial: Selva Estética Landing Portal\n'
                        '• Representante: Selva Estética - Desarrollo de Software',
                      ),

                      const SizedBox(height: 32),
                      const Divider(),
                      const SizedBox(height: 24),

                      // Back Button & Action
                      Wrap(
                        spacing: 16,
                        runSpacing: 12,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => context.go('/'),
                            icon: const Icon(Icons.arrow_back, size: 18),
                            label: const Text('Volver al Inicio'),
                          ),
                          OutlinedButton.icon(
                            onPressed: () => context.go('/condiciones-de-servicio'),
                            icon: const Icon(Icons.description_outlined, size: 18),
                            label: const Text('Ver Condiciones de Servicio'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 12),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppTheme.primaryDark,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
      ),
    );
  }

  Widget _buildParagraph(String content) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 15,
        color: AppTheme.textSecondary,
        height: 1.7,
      ),
    );
  }
}
