import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

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
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryGreen,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.gavel, color: Colors.white, size: 14),
                            SizedBox(width: 6),
                            Text(
                              'MARCO LEGAL',
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
                        'Condiciones de Servicio',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: AppTheme.primaryDark,
                              fontSize: isMobile ? 30 : 42,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Términos y condiciones para el uso de la aplicación "Selva Estética"',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppTheme.primaryLight,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Icon(Icons.calendar_today, size: 16, color: AppTheme.textSecondary),
                          SizedBox(width: 6),
                          Text(
                            'Vigencia a partir de: Septiembre 2026',
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

            // Terms Content
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
                      _buildSectionTitle(context, '1. Aceptación de los Términos'),
                      _buildParagraph(
                        'Al acceder, descargar o utilizar la aplicación móvil "Selva Estética" (en adelante, "el Servicio"), el usuario manifiesta haber leído, comprendido y aceptado en su totalidad los presentes Términos y Condiciones de Servicio.\n\n'
                        'Si usted no está de acuerdo con cualquiera de estas disposiciones, le solicitamos abstenerse de utilizar la aplicación.',
                      ),

                      _buildSectionTitle(context, '2. Descripción del Servicio'),
                      _buildParagraph(
                        'Selva Estética es una herramienta digital de productividad diseñada para profesionales del sector de la estética, cosmetología y bienestar personal.\n\n'
                        'La aplicación facilita la gestión administrativa de pacientes, el registro de información de contacto y salud relevante para tratamientos dermocosméticos, y la coordinación de calendarios y turnos de atención.',
                      ),

                      _buildSectionTitle(context, '3. Responsabilidad del Profesional y Consentimiento Informado'),
                      _buildParagraph(
                        'El usuario profesional es el único responsable de la exactitud y veracidad de los datos que ingresa en la plataforma respecto a sus pacientes, así como de contar con el debido consentimiento informado previo a la realización de cualquier procedimiento estético.\n\n'
                        'Selva Estética actúa como una plataforma facilitadora de gestión y no asume responsabilidad clínica, médica ni legal sobre los tratamientos ejecutados por el profesional.',
                      ),

                      _buildSectionTitle(context, '4. Seguridad de la Cuenta y Acceso'),
                      _buildParagraph(
                        'El usuario es responsable de mantener la confidencialidad de sus credenciales de acceso (incluyendo cuentas vinculadas de Google Sign-In) y de todas las actividades efectuadas bajo su cuenta. Deberá notificar de inmediato cualquier sospecha de acceso no autorizado.',
                      ),

                      _buildSectionTitle(context, '5. Propiedad Intelectual'),
                      _buildParagraph(
                        'Todos los derechos de propiedad intelectual sobre el software, diseño de interfaces, logotipos, marcas comerciales ("Selva Estética - Tu belleza, nuestra pasión"), código fuente e iconografía corresponden exclusivamente a Selva Estética y sus desarrolladores legítimos.',
                      ),

                      _buildSectionTitle(context, '6. Disponibilidad del Servicio y Actualizaciones'),
                      _buildParagraph(
                        'Nos esforzamos por garantizar una alta disponibilidad de la aplicación; sin embargo, el servicio puede experimentar interrupciones programadas por mantenimiento o actualizaciones para mejorar el rendimiento y la seguridad del sistema.',
                      ),

                      _buildSectionTitle(context, '7. Cancelación y Terminación'),
                      _buildParagraph(
                        'El usuario puede dejar de utilizar la plataforma en cualquier momento y solicitar la baja definitiva de su cuenta y borrado de sus datos conforme a lo estipulado en nuestras Políticas de Privacidad.',
                      ),

                      _buildSectionTitle(context, '8. Legislación Aplicable y Contacto'),
                      _buildParagraph(
                        'Los presentes términos se regirán e interpretarán conforme a las leyes vigentes. Para cualquier notificación legal o consulta comercial, contáctenos en:\n\n'
                        '• Correo Electrónico: soporte@esteticaselva.com',
                      ),

                      const SizedBox(height: 32),
                      const Divider(),
                      const SizedBox(height: 24),

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
                            onPressed: () => context.go('/politicas-de-privacidad'),
                            icon: const Icon(Icons.security, size: 18),
                            label: const Text('Ver Políticas de Privacidad'),
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
