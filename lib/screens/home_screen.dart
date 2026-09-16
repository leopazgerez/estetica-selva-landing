import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';
import '../widgets/device_showcase.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _showcaseKey = GlobalKey();
  final GlobalKey _faqKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    return Scaffold(
      appBar: Navbar(
        onFeaturesTap: () => _scrollTo(_featuresKey),
        onShowcaseTap: () => _scrollTo(_showcaseKey),
        onFaqTap: () => _scrollTo(_faqKey),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Hero Section
            _buildHeroSection(context, isMobile),

            // 2. Trust Badges Strip
            _buildTrustStrip(context, isMobile),

            // 3. Features Section
            Container(
              key: _featuresKey,
              child: _buildFeaturesSection(context, isMobile),
            ),

            // 4. Device Showcase Section (The screenshots of the app)
            Container(
              key: _showcaseKey,
              child: const DeviceShowcase(),
            ),

            // 5. Security & Google Compliance Spotlight
            _buildGoogleComplianceSection(context, isMobile),

            // 6. FAQ Section
            Container(
              key: _faqKey,
              child: _buildFaqSection(context, isMobile),
            ),

            // 7. Final Call to Action Banner
            _buildCtaBanner(context, isMobile),

            // 8. Footer
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.backgroundWarm,
        image: DecorationImage(
          image: const AssetImage('assets/logo/logo_splash.png'),
          alignment: Alignment.centerRight,
          opacity: 0.04,
          fit: BoxFit.contain,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 36 : 64,
        horizontal: 24,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: AppTheme.contentMaxWidth(context)),
          child: isMobile
              ? Column(
                  children: [
                    _buildHeroContent(context, true),
                    const SizedBox(height: 36),
                    _buildHeroVisual(context, true),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: _buildHeroContent(context, false)),
                    const SizedBox(width: 48),
                    Expanded(flex: 5, child: _buildHeroVisual(context, false)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildHeroContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Tagline badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.accentMint.withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppTheme.primaryGreen.withValues(alpha: 0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.spa, size: 16, color: AppTheme.primaryGreen),
              SizedBox(width: 8),
              Text(
                'TU BELLEZA, NUESTRA PASIÓN',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryGreen,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Tu centro de estética organizado con elegancia y simplicidad.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: isMobile ? 32 : 46,
                fontWeight: FontWeight.w800,
                color: AppTheme.primaryDark,
                height: 1.18,
              ),
        ),
        const SizedBox(height: 18),
        Text(
          'Estetica Selva es la plataforma inteligente creada para profesionales de la salud estética. El propósito de la aplicación es brindar una herramienta de gestión integral de pacientes, turnos y tratamientos. La integración con Google se utiliza para asegurar tu cuenta y sincronizar tus turnos con Google Calendar de forma privada.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 15 : 17,
                height: 1.6,
              ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () => _scrollTo(_showcaseKey),
              icon: const Icon(Icons.phone_iphone, size: 18),
              label: const Text('Explorar la Aplicación'),
            ),
            OutlinedButton.icon(
              onPressed: () => context.go('/politicas-de-privacidad'),
              icon: const Icon(Icons.shield_outlined, size: 18),
              label: const Text('Políticas de Privacidad'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: const [
            Icon(Icons.verified, color: AppTheme.primaryGreen, size: 18),
            SizedBox(width: 6),
            Text(
              'Verificación Google App & Cumplimiento Play Store',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroVisual(BuildContext context, bool isMobile) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background soft circle
          Container(
            width: isMobile ? 260 : 340,
            height: isMobile ? 260 : 340,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.accentMint.withValues(alpha: 0.3),
            ),
          ),
          // Phone preview mockup
          Container(
            width: isMobile ? 220 : 270,
            height: isMobile ? 440 : 540,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              color: Colors.black,
              border: Border.all(color: const Color(0xFF1F2922), width: 6),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryDark.withValues(alpha: 0.25),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/branding/Screenshot_20260914_110935.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppTheme.backgroundWarm,
                  child: const Center(
                    child: Icon(Icons.spa, size: 48, color: AppTheme.primaryGreen),
                  ),
                ),
              ),
            ),
          ),
          // Floating Pill Badge: Pacientes Activos
          Positioned(
            bottom: 30,
            left: isMobile ? 0 : -20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.borderLight),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: AppTheme.accentMint,
                    child: Icon(Icons.check, size: 14, color: AppTheme.primaryGreen),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Gestión en Tiempo Real',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrustStrip(BuildContext context, bool isMobile) {
    final items = [
      {'icon': Icons.lock_outline, 'title': 'Privacidad Máxima', 'desc': 'Datos protegidos y aislados'},
      {'icon': Icons.calendar_today_outlined, 'title': 'Agenda Fluida', 'desc': 'Control preciso de turnos'},
      {'icon': Icons.assignment_ind_outlined, 'title': 'Ficha Clínica', 'desc': 'Historial y emergencias'},
      {'icon': Icons.verified_outlined, 'title': 'Google Verificado', 'desc': 'Cumplimiento de normativas'},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: AppTheme.contentMaxWidth(context)),
          child: isMobile
              ? Column(
                  children: items.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Icon(item['icon'] as IconData, color: AppTheme.primaryGreen),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              Text(item['desc'] as String, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: items.map((item) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppTheme.accentMint.withValues(alpha: 0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(item['icon'] as IconData, color: AppTheme.primaryGreen, size: 22),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'] as String,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.textPrimary),
                            ),
                            Text(
                              item['desc'] as String,
                              style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
                            ),
                          ],
                        ),
                      ],
                    );
                  }).toList(),
                ),
        ),
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context, bool isMobile) {
    final features = [
      {
        'icon': Icons.person_add_outlined,
        'title': 'Ficha Completa de Paciente',
        'desc': 'Almacena datos personales, fecha de nacimiento, cantidad de hijos, ocupación y contactos de emergencia para una atención segura.',
        'tag': 'Atención Segura',
      },
      {
        'icon': Icons.calendar_month_outlined,
        'title': 'Agenda y Turnos Dinámicos',
        'desc': 'Coordina sesiones por tipo de tratamiento (faciales, masajes, aparatología) con bloques horarios y notas de seguimiento.',
        'tag': 'Cero Solapamientos',
      },
      {
        'icon': Icons.analytics_outlined,
        'title': 'Métricas del Consultorio',
        'desc': 'Visualiza pacientes atendidos hoy, durante la semana y total histórico para planificar el crecimiento de tu centro.',
        'tag': 'Control Total',
      },
      {
        'icon': Icons.shield_outlined,
        'title': 'Seguridad y Privacidad Estricta',
        'desc': 'Diseñado con arquitectura de respeto a la privacidad: tus datos no se venden ni se comparten con redes de publicidad.',
        'tag': 'Google Ready',
      },
    ];

    return Container(
      color: AppTheme.backgroundWarm,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 48 : 80,
        horizontal: 24,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: AppTheme.contentMaxWidth(context)),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.accentMint.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'CARACTERÍSTICAS PRINCIPALES',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryGreen,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Todo lo que necesitas para tu práctica estética',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: isMobile ? 26 : 36,
                    ),
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 620),
                child: Text(
                  'Diseño limpio, navegación intuitiva y herramientas pensadas exclusivamente para consultorios estéticos.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 48),

              // Features 2x2 Grid or 1 col on mobile
              isMobile
                  ? Column(
                      children: features.map((f) => _buildFeatureCard(f)).toList(),
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        return Wrap(
                          spacing: 24,
                          runSpacing: 24,
                          children: features.map((f) {
                            return SizedBox(
                              width: (constraints.maxWidth - 24) / 2,
                              child: _buildFeatureCard(f),
                            );
                          }).toList(),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(Map<String, dynamic> f) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppTheme.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppTheme.primarySubtle,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(f['icon'] as IconData, color: AppTheme.primaryGreen, size: 24),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.accentMint.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  f['tag'] as String,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryGreen,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            f['title'] as String,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            f['desc'] as String,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoogleComplianceSection(BuildContext context, bool isMobile) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 48 : 72,
        horizontal: 24,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: AppTheme.contentMaxWidth(context)),
          padding: EdgeInsets.all(isMobile ? 24 : 48),
          decoration: BoxDecoration(
            color: AppTheme.primarySubtle,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppTheme.accentMint),
          ),
          child: Column(
            children: [
              const Icon(Icons.verified_user_outlined, size: 48, color: AppTheme.primaryGreen),
              const SizedBox(height: 16),
              Text(
                'Cumplimiento con las Normativas de Google',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppTheme.primaryDark,
                      fontSize: isMobile ? 22 : 28,
                    ),
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: const Text(
                  'Este sitio web provee el portal oficial de Estetica Selva para la verificación de aplicaciones de Google (OAuth & Google Play Console). Nuestras políticas de privacidad detallan expresamente qué datos se recopilan, cómo se protegen y el procedimiento directo para solicitar la eliminación de datos del usuario.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppTheme.textSecondary,
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => context.go('/politicas-de-privacidad'),
                    icon: const Icon(Icons.shield_outlined, size: 18),
                    label: const Text('Leer Políticas de Privacidad'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => context.go('/condiciones-de-servicio'),
                    icon: const Icon(Icons.description_outlined, size: 18),
                    label: const Text('Leer Condiciones de Servicio'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFaqSection(BuildContext context, bool isMobile) {
    final faqs = [
      {
        'q': '¿Cómo garantiza Selva Estética la privacidad de los pacientes?',
        'a': 'Los datos de las fichas (nombres, teléfonos, tratamientos y antecedentes) son de uso exclusivo del profesional dentro de la aplicación. Selva Estética no comercializa ni cede información personal a redes de publicidad ni terceras partes.',
      },
      {
        'q': '¿Cómo solicita un usuario la eliminación definitiva de su cuenta o datos?',
        'a': 'Cualquier usuario puede solicitar el borrado permanente de sus datos enviando un correo electrónico a soporte@esteticaselva.com con el asunto "Solicitud de Eliminación de Datos". La solicitud es procesada en un plazo máximo de 72 horas hábiles.',
      },
      {
        'q': '¿Por qué la app requiere acceso a cuentas de Google?',
        'a': 'El inicio de sesión mediante Google (Google Sign-In) y la sincronización con Google Calendar permiten una autenticación segura y evitar duplicidad de turnos. El uso de datos se adhiere de forma estricta a la Política de Datos de Usuario de los Servicios de API de Google.',
      },
      {
        'q': '¿Puedo acceder a las políticas de privacidad directamente desde Google Console?',
        'a': 'Sí, la URL directa para la verificación de Google es /politicas-de-privacidad (o /privacy) y para los términos /condiciones-de-servicio (o /terms), ambas disponibles y activas en este dominio web.',
      },
    ];

    return Container(
      color: AppTheme.backgroundWarm,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 48 : 80,
        horizontal: 24,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 820),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.accentMint.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'PREGUNTAS FRECUENTES',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primaryGreen,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Transparencia y Seguridad',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: isMobile ? 26 : 34,
                    ),
              ),
              const SizedBox(height: 40),

              Column(
                children: faqs.map((faq) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppTheme.borderLight),
                    ),
                    child: ExpansionTile(
                      shape: const Border(),
                      tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      childrenPadding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                      title: Text(
                        faq['q']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primaryDark,
                        ),
                      ),
                      children: [
                        Text(
                          faq['a']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppTheme.textSecondary,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCtaBanner(BuildContext context, bool isMobile) {
    return Container(
      color: AppTheme.primaryDark,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 48 : 72,
        horizontal: 24,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 860),
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/logo/logo_splash.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.spa, color: AppTheme.primaryGreen),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'SELVA ESTÉTICA',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Optimiza tu centro de estética hoy mismo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Accede a la plataforma diseñada para elevar la experiencia de tus pacientes.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFB5C9BD),
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => context.go('/politicas-de-privacidad'),
                    icon: const Icon(Icons.verified, size: 18),
                    label: const Text('Políticas de Privacidad (Google)'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppTheme.primaryDark,
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => context.go('/condiciones-de-servicio'),
                    icon: const Icon(Icons.description_outlined, size: 18),
                    label: const Text('Condiciones de Servicio'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
