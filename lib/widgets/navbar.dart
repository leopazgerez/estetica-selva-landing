import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onFeaturesTap;
  final VoidCallback? onShowcaseTap;
  final VoidCallback? onFaqTap;

  const Navbar({
    super.key,
    this.onFeaturesTap,
    this.onShowcaseTap,
    this.onFaqTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  void _navigateTo(BuildContext context, String path) {
    if (GoRouterState.of(context).uri.path != path) {
      context.go(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);
    final currentPath = GoRouterState.of(context).uri.path;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppTheme.backgroundWarm.withValues(alpha: 0.95),
        border: const Border(
          bottom: BorderSide(color: AppTheme.borderLight, width: 1),
        ),
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: AppTheme.contentMaxWidth(context)),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Logo & Title
              InkWell(
                onTap: () => _navigateTo(context, '/'),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: AppTheme.borderLight),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
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
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SELVA',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 2.0,
                                  color: AppTheme.primaryGreen,
                                  fontSize: 18,
                                ),
                          ),
                          Text(
                            'ESTÉTICA & BIENESTAR',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  letterSpacing: 1.2,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.textSecondary,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Desktop Menu Links
              if (!isMobile)
                Row(
                  children: [
                    _NavLink(
                      label: 'Inicio',
                      isActive: currentPath == '/',
                      onTap: () => _navigateTo(context, '/'),
                    ),
                    _NavLink(
                      label: 'Funcionalidades',
                      onTap: () {
                        if (currentPath != '/') {
                          _navigateTo(context, '/');
                        }
                        onFeaturesTap?.call();
                      },
                    ),
                    _NavLink(
                      label: 'Capturas',
                      onTap: () {
                        if (currentPath != '/') {
                          _navigateTo(context, '/');
                        }
                        onShowcaseTap?.call();
                      },
                    ),
                    _NavLink(
                      label: 'Privacidad',
                      isActive: currentPath == '/politicas-de-privacidad' ||
                          currentPath == '/privacy',
                      onTap: () => _navigateTo(context, '/politicas-de-privacidad'),
                    ),
                    _NavLink(
                      label: 'Términos',
                      isActive: currentPath == '/condiciones-de-servicio' ||
                          currentPath == '/terms',
                      onTap: () => _navigateTo(context, '/condiciones-de-servicio'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: () => _navigateTo(context, '/politicas-de-privacidad'),
                      icon: const Icon(Icons.verified_user_outlined, size: 18),
                      label: const Text('Verificación Google'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              else
                // Mobile Menu Button
                IconButton(
                  icon: const Icon(Icons.menu, color: AppTheme.primaryGreen, size: 28),
                  onPressed: () => _showMobileMenu(context),
                  tooltip: 'Abrir menú',
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.backgroundWarm,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (bottomSheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Menú Selva Estética',
                      style: Theme.of(bottomSheetContext).textTheme.titleLarge?.copyWith(
                            color: AppTheme.primaryGreen,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(bottomSheetContext),
                    ),
                  ],
                ),
                const Divider(height: 24),
                ListTile(
                  leading: const Icon(Icons.home_outlined, color: AppTheme.primaryGreen),
                  title: const Text('Inicio'),
                  onTap: () {
                    Navigator.pop(bottomSheetContext);
                    _navigateTo(context, '/');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.featured_play_list_outlined, color: AppTheme.primaryGreen),
                  title: const Text('Funcionalidades'),
                  onTap: () {
                    Navigator.pop(bottomSheetContext);
                    if (GoRouterState.of(context).uri.path != '/') {
                      _navigateTo(context, '/');
                    }
                    onFeaturesTap?.call();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.phone_iphone_outlined, color: AppTheme.primaryGreen),
                  title: const Text('Capturas de la App'),
                  onTap: () {
                    Navigator.pop(bottomSheetContext);
                    if (GoRouterState.of(context).uri.path != '/') {
                      _navigateTo(context, '/');
                    }
                    onShowcaseTap?.call();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined, color: AppTheme.primaryGreen),
                  title: const Text('Políticas de Privacidad'),
                  subtitle: const Text('Ruta requerida por Google'),
                  onTap: () {
                    Navigator.pop(bottomSheetContext);
                    _navigateTo(context, '/politicas-de-privacidad');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.gavel_outlined, color: AppTheme.primaryGreen),
                  title: const Text('Condiciones de Servicio'),
                  onTap: () {
                    Navigator.pop(bottomSheetContext);
                    _navigateTo(context, '/condiciones-de-servicio');
                  },
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(bottomSheetContext);
                    _navigateTo(context, '/politicas-de-privacidad');
                  },
                  icon: const Icon(Icons.verified_user_outlined),
                  label: const Text('Verificación Google App'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const _NavLink({
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: isActive ? AppTheme.primaryGreen : AppTheme.textPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor:
              isActive ? AppTheme.accentMint.withValues(alpha: 0.35) : Colors.transparent,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
