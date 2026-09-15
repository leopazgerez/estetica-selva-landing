import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppScreenItem {
  final String title;
  final String description;
  final String imagePath;
  final IconData icon;

  const AppScreenItem({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.icon,
  });
}

class DeviceShowcase extends StatefulWidget {
  const DeviceShowcase({super.key});

  @override
  State<DeviceShowcase> createState() => _DeviceShowcaseState();
}

class _DeviceShowcaseState extends State<DeviceShowcase> {
  int _selectedIndex = 0;

  final List<AppScreenItem> _screens = const [
    AppScreenItem(
      title: 'Panel Principal',
      description: 'Métricas diarias, pacientes recientes y accesos rápidos.',
      imagePath: 'assets/branding/Screenshot_20260914_110935.png',
      icon: Icons.dashboard_outlined,
    ),
    AppScreenItem(
      title: 'Ficha de Paciente',
      description: 'Registro detallado: datos médicos, antecedentes y contactos.',
      imagePath: 'assets/branding/Screenshot_20260914_111004.png',
      icon: Icons.person_add_alt_outlined,
    ),
    AppScreenItem(
      title: 'Directorio',
      description: 'Búsqueda instantánea de pacientes con historial completo.',
      imagePath: 'assets/branding/Screenshot_20260914_111024.png',
      icon: Icons.people_alt_outlined,
    ),
    AppScreenItem(
      title: 'Agenda y Turnos',
      description: 'Calendario inteligente para tratamientos y horarios.',
      imagePath: 'assets/branding/Screenshot_20260914_111039.png',
      icon: Icons.calendar_month_outlined,
    ),
    AppScreenItem(
      title: 'Bienvenida',
      description: 'Identidad y diseño exclusivo pensado para la estética.',
      imagePath: 'assets/branding/Screenshot_20260914_111052.png',
      icon: Icons.spa_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    final activeItem = _screens[_selectedIndex];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 32 : 64,
        horizontal: isMobile ? 16 : 24,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: AppTheme.contentMaxWidth(context)),
          child: Column(
            children: [
              // Section Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.accentMint.withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.touch_app, size: 16, color: AppTheme.primaryGreen),
                    SizedBox(width: 8),
                    Text(
                      'INTERFAZ EN ACCIÓN',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryGreen,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Diseñada para la fluidez de tu día a día',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: isMobile ? 28 : 36,
                    ),
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 680),
                child: Text(
                  'Explora cada una de las pantallas de Selva Estética con una paleta orgánica que transmite bienestar a tus profesionales y pacientes.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 40),

              // Selector Tabs
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_screens.length, (index) {
                    final item = _screens[index];
                    final isSelected = index == _selectedIndex;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppTheme.primaryGreen
                                : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: isSelected
                                  ? AppTheme.primaryGreen
                                  : AppTheme.borderLight,
                            ),
                            boxShadow: [
                              if (isSelected)
                                BoxShadow(
                                  color: AppTheme.primaryGreen.withValues(alpha: 0.25),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                item.icon,
                                size: 18,
                                color: isSelected
                                    ? Colors.white
                                    : AppTheme.textSecondary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? Colors.white
                                      : AppTheme.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 48),

              // Showcase Body (Phone Mockup + Details)
              if (isMobile)
                Column(
                  children: [
                    _buildPhoneMockup(activeItem.imagePath),
                    const SizedBox(height: 28),
                    _buildScreenInfoCard(activeItem),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 32),
                          child: _buildPhoneMockup(activeItem.imagePath),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 440),
                          child: _buildScreenInfoCard(activeItem),
                        ),
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

  Widget _buildPhoneMockup(String imagePath) {
    return Container(
      width: 290,
      height: 590,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(color: const Color(0xFF1E2822), width: 7),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryDark.withValues(alpha: 0.2),
            blurRadius: 36,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(39),
        child: Stack(
          children: [
            // Screenshot Image
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppTheme.backgroundWarm,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.image_not_supported,
                            color: AppTheme.primaryGreen, size: 40),
                        SizedBox(height: 8),
                        Text('Captura de la App'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Dynamic Island / Camera Notch indicator
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                width: 80,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenInfoCard(AppScreenItem item) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.accentMint.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(item.icon, color: AppTheme.primaryGreen, size: 26),
          ),
          const SizedBox(height: 20),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item.description,
            style: const TextStyle(
              fontSize: 15,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),
          Row(
            children: const [
              Icon(Icons.check_circle, color: AppTheme.primaryGreen, size: 18),
              SizedBox(width: 8),
              Text(
                'Datos cifrados y almacenados localmente',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.check_circle, color: AppTheme.primaryGreen, size: 18),
              SizedBox(width: 8),
              Text(
                'Sincronización fluida y respetuosa de privacidad',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
