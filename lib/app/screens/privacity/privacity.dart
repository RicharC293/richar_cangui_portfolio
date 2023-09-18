import 'package:flutter/material.dart';
import 'package:richar/app/utils/constants.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  static const routeName = '/privacy-policy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: kCanvas6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: spacing4),
            Text(
              'Política de Privacidad',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Última actualización: 2021-09-26',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Esta aplicación respeta y protege la privacidad de todos los usuarios que la utilizan. No recopilamos ni solicitamos información sensible ni accedemos a datos del dispositivo. A continuación, se detalla qué información se recopila y cómo se utiliza:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Información Recopilada',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Esta aplicación no recopila ningún tipo de información personal, incluyendo pero no limitándose a:',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Nombres',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Direcciones de correo electrónico',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Números de teléfono',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Información de ubicación',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Datos del dispositivo',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Uso de la Información',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Dado que no recopilamos información personal, no utilizamos ningún dato para ningún propósito.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Compartir Información',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: spacing4),
            Text(
              'No compartimos ninguna información personal, ya que no se recopila ningún tipo de dato personal.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Seguridad',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: spacing4),
            Text(
              'La seguridad de los datos de los usuarios es nuestra máxima prioridad. A pesar de que no recopilamos información personal, implementamos medidas de seguridad para garantizar la protección de cualquier dato que se pueda generar durante el uso de la aplicación.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Cambios en la Política de Privacidad',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Podemos actualizar esta Política de Privacidad ocasionalmente. Se recomienda revisar esta página periódicamente para estar al tanto de cualquier cambio. Se considerará que ha aceptado cualquier modificación de esta Política de Privacidad si continúa utilizando la aplicación después de que dichos cambios entren en vigencia.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Contacto',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Si tiene alguna pregunta o inquietud sobre esta Política de Privacidad, no dude en contactarnos en contactos@richarcangui.com.',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Richar Cangui',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: spacing4),
            Text(
              'Developer Engieer © 2023',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
