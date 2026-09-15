import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppTheme.isMobile(context);

    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.primaryDark,
        border: Border(
          top: BorderSide(color: Color(0xFF284835), width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 24),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: AppTheme.contentMaxWidth(context)),
          child: Column(
            children: [
              // Top Section: Brand + Links Columns
              if (isMobile)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBrandInfo(context),
                    const SizedBox(height: 32),
                    const Divider(color: Color(0xFF2E533E)),
                    const SizedBox(height: 24),
                    _buildLegalLinks(context),
                    const SizedBox(height: 24),
                    _buildGoogleComplianceBadge(context),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 3, child: _buildBrandInfo(context)),
                    const SizedBox(width: 40),
                    Expanded(flex: 2, child: _buildLegalLinks(context)),
                    const SizedBox(width: 40),
                    Expanded(flex: 3, child: _buildGoogleComplianceBadge(context)),
                  ],
                ),

              const SizedBox(height: 48),
              const Divider(color: Color(0xFF254633)),
              const SizedBox(height: 24),

              // Bottom copyright & disclaimer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '© ${DateTime.now().year} Selva Estética. Todos los derechos reservados.',
                      style: const TextStyle(
                        color: Color(0xFFA1B5A9),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'Versión Web 1.0.0',
                    style: TextStyle(
                      color: const Color(0xFFA1B5A9).withValues(alpha: 0.7),
                      fontSize: 12,
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

  Widget _buildBrandInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 38,
              height: 38,
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
            const SizedBox(width: 12),
            const Text(
              'SELVA ESTÉTICA',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Tu belleza, nuestra pasión. Plataforma integral para la gestión de centros estéticos, pacientes y turnos con máxima seguridad y privacidad.',
          style: TextStyle(
            color: Color(0xFFB5C9BD),
            fontSize: 14,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(Icons.email_outlined, color: AppTheme.accentMint, size: 16),
            const SizedBox(width: 8),
            Text(
              'soporte@esteticaselva.com',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLegalLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DOCUMENTOS LEGALES',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        _FooterLink(
          label: 'Políticas de Privacidad',
          icon: Icons.shield_outlined,
          onTap: () => context.go('/politicas-de-privacidad'),
        ),
        const SizedBox(height: 12),
        _FooterLink(
          label: 'Condiciones de Servicio',
          icon: Icons.description_outlined,
          onTap: () => context.go('/condiciones-de-servicio'),
        ),
        const SizedBox(height: 12),
        _FooterLink(
          label: 'Eliminación de Datos',
          icon: Icons.delete_outline,
          onTap: () => context.go('/politicas-de-privacidad'),
        ),
      ],
    );
  }

  Widget _buildGoogleComplianceBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3F2D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2F5C43)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.verified, color: AppTheme.accentMint, size: 20),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Verificación de Google App',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Portal oficial validado con rutas dedicadas para revisión de políticas de privacidad de Google OAuth, Google Play Console y Google Cloud Platform.',
            style: TextStyle(
              color: Color(0xFFB5C9BD),
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _FooterLink({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppTheme.accentMint, size: 16),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  color: Color(0xFFD6E3DB),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
