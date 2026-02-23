import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : IniciarSesionWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : IniciarSesionWidget(),
        ),
        FFRoute(
            name: PrincipalWidget.routeName,
            path: PrincipalWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Principal')
                : NavBarPage(
                    initialPage: 'Principal',
                    page: PrincipalWidget(
                      balanceMensualPARAM: params.getParam(
                        'balanceMensualPARAM',
                        ParamType.double,
                      ),
                    ),
                  )),
        FFRoute(
            name: MiCuentaWidget.routeName,
            path: MiCuentaWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Mi_Cuenta')
                : NavBarPage(
                    initialPage: 'Mi_Cuenta',
                    page: MiCuentaWidget(),
                  )),
        FFRoute(
          name: IniciarSesionWidget.routeName,
          path: IniciarSesionWidget.routePath,
          builder: (context, params) => IniciarSesionWidget(),
        ),
        FFRoute(
          name: RecuperoCuentaWidget.routeName,
          path: RecuperoCuentaWidget.routePath,
          builder: (context, params) => RecuperoCuentaWidget(),
        ),
        FFRoute(
            name: MisCaballosWidget.routeName,
            path: MisCaballosWidget.routePath,
            asyncParams: {
              'historialClinico':
                  getDoc(['Vacunacion'], VacunacionRecord.fromSnapshot),
            },
            builder: (context, params) => params.isEmpty
                ? NavBarPage(
                    initialPage: 'Mis_Caballos',
                    disableResizeToAvoidBottomInset: true,
                  )
                : NavBarPage(
                    initialPage: 'Mis_Caballos',
                    page: MisCaballosWidget(
                      historialClinico: params.getParam(
                        'historialClinico',
                        ParamType.Document,
                      ),
                    ),
                    disableResizeToAvoidBottomInset: true,
                  )),
        FFRoute(
            name: CambioContraseniaWidget.routeName,
            path: CambioContraseniaWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: CambioContraseniaWidget(),
                )),
        FFRoute(
            name: CaballoSeleccionadoWidget.routeName,
            path: CaballoSeleccionadoWidget.routePath,
            asyncParams: {
              'caballoSeleccionado':
                  getDoc(['Equino'], EquinoRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: CaballoSeleccionadoWidget(
                    caballoSeleccionado: params.getParam(
                      'caballoSeleccionado',
                      ParamType.Document,
                    ),
                    navegaDesdePublicacion: params.getParam(
                      'navegaDesdePublicacion',
                      ParamType.bool,
                    ),
                  ),
                )),
        FFRoute(
            name: MarketPrincipalWidget.routeName,
            path: MarketPrincipalWidget.routePath,
            asyncParams: {
              'filtroExterno': getDoc(['Filtro'], FiltroRecord.fromSnapshot),
            },
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Market_Principal')
                : NavBarPage(
                    initialPage: 'Market_Principal',
                    page: MarketPrincipalWidget(
                      textoBusquedaExterno: params.getParam(
                        'textoBusquedaExterno',
                        ParamType.String,
                      ),
                      filtroExterno: params.getParam(
                        'filtroExterno',
                        ParamType.Document,
                      ),
                    ),
                  )),
        FFRoute(
          name: NuevaCuentaWidget.routeName,
          path: NuevaCuentaWidget.routePath,
          builder: (context, params) => NuevaCuentaWidget(),
        ),
        FFRoute(
            name: NuevaPublicacionCaballoWidget.routeName,
            path: NuevaPublicacionCaballoWidget.routePath,
            requireAuth: true,
            asyncParams: {
              'caballoSeleccionado':
                  getDoc(['Equino'], EquinoRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: NuevaPublicacionCaballoWidget(
                    caballoSeleccionado: params.getParam(
                      'caballoSeleccionado',
                      ParamType.Document,
                    ),
                    tituloPublicacion: params.getParam(
                      'tituloPublicacion',
                      ParamType.String,
                    ),
                    descripcionPublicacion: params.getParam(
                      'descripcionPublicacion',
                      ParamType.String,
                    ),
                    precioPublicacion: params.getParam(
                      'precioPublicacion',
                      ParamType.String,
                    ),
                    ubicacionPublicacion: params.getParam(
                      'ubicacionPublicacion',
                      ParamType.String,
                    ),
                    contactoPublicacion: params.getParam(
                      'contactoPublicacion',
                      ParamType.String,
                    ),
                    listaFotosCaballoPARAM: params.getParam<String>(
                      'listaFotosCaballoPARAM',
                      ParamType.String,
                      isList: true,
                    ),
                    navegaDesdeCaballoEspecifico: params.getParam(
                      'navegaDesdeCaballoEspecifico',
                      ParamType.bool,
                    ),
                  ),
                )),
        FFRoute(
            name: NuevoCaballoWidget.routeName,
            path: NuevoCaballoWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: NuevoCaballoWidget(),
                )),
        FFRoute(
            name: NuevaPublicacionInicioWidget.routeName,
            path: NuevaPublicacionInicioWidget.routePath,
            requireAuth: true,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: NuevaPublicacionInicioWidget(),
                )),
        FFRoute(
            name: NuevaPublicacionProductoServicioWidget.routeName,
            path: NuevaPublicacionProductoServicioWidget.routePath,
            requireAuth: true,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: NuevaPublicacionProductoServicioWidget(
                    tipoPublicacion: params.getParam(
                      'tipoPublicacion',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
            name: SeleccionarMisEquinosWidget.routeName,
            path: SeleccionarMisEquinosWidget.routePath,
            asyncParams: {
              'caballoSeleccionadoPARAM':
                  getDoc(['Equino'], EquinoRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: SeleccionarMisEquinosWidget(
                    tituloPublicacion: params.getParam(
                      'tituloPublicacion',
                      ParamType.String,
                    ),
                    descripcionPublicacion: params.getParam(
                      'descripcionPublicacion',
                      ParamType.String,
                    ),
                    precioPublicacion: params.getParam(
                      'precioPublicacion',
                      ParamType.String,
                    ),
                    ubicacionPublicacion: params.getParam(
                      'ubicacionPublicacion',
                      ParamType.String,
                    ),
                    contactoPublicacion: params.getParam(
                      'contactoPublicacion',
                      ParamType.String,
                    ),
                    caballoSeleccionadoPARAM: params.getParam(
                      'caballoSeleccionadoPARAM',
                      ParamType.Document,
                    ),
                  ),
                )),
        FFRoute(
            name: NuevaVisitaVeterinariaWidget.routeName,
            path: NuevaVisitaVeterinariaWidget.routePath,
            asyncParams: {
              'caballoSeleccionado':
                  getDoc(['Equino'], EquinoRecord.fromSnapshot),
              'veterinarioCabecera': getDoc(
                  ['MedicoVeterinario'], MedicoVeterinarioRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: NuevaVisitaVeterinariaWidget(
                    caballoSeleccionado: params.getParam(
                      'caballoSeleccionado',
                      ParamType.Document,
                    ),
                    veterinarioCabecera: params.getParam(
                      'veterinarioCabecera',
                      ParamType.Document,
                    ),
                  ),
                )),
        FFRoute(
            name: MarketPublicacionSeleccionadaWidget.routeName,
            path: MarketPublicacionSeleccionadaWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: MarketPublicacionSeleccionadaWidget(
                    idArticuloPublicacion: params.getParam(
                      'idArticuloPublicacion',
                      ParamType.int,
                    ),
                  ),
                )),
        FFRoute(
          name: ZPlantilla5Widget.routeName,
          path: ZPlantilla5Widget.routePath,
          builder: (context, params) => ZPlantilla5Widget(),
        ),
        FFRoute(
          name: ZPlantilla4Widget.routeName,
          path: ZPlantilla4Widget.routePath,
          builder: (context, params) => ZPlantilla4Widget(),
        ),
        FFRoute(
          name: ZPlantilla1Widget.routeName,
          path: ZPlantilla1Widget.routePath,
          builder: (context, params) => ZPlantilla1Widget(),
        ),
        FFRoute(
          name: ZPlantillaCreacionProductoWidget.routeName,
          path: ZPlantillaCreacionProductoWidget.routePath,
          builder: (context, params) => ZPlantillaCreacionProductoWidget(),
        ),
        FFRoute(
          name: ZPlantilla2Widget.routeName,
          path: ZPlantilla2Widget.routePath,
          builder: (context, params) => ZPlantilla2Widget(),
        ),
        FFRoute(
          name: ZPlantilla3Widget.routeName,
          path: ZPlantilla3Widget.routePath,
          builder: (context, params) => ZPlantilla3Widget(),
        ),
        FFRoute(
          name: CaleWidget.routeName,
          path: CaleWidget.routePath,
          builder: (context, params) => CaleWidget(),
        ),
        FFRoute(
          name: Details03TransactionsSummaryWidget.routeName,
          path: Details03TransactionsSummaryWidget.routePath,
          builder: (context, params) => Details03TransactionsSummaryWidget(),
        ),
        FFRoute(
          name: QuizWidget.routeName,
          path: QuizWidget.routePath,
          builder: (context, params) => QuizWidget(),
        ),
        FFRoute(
            name: PaginaCalendarioWidget.routeName,
            path: PaginaCalendarioWidget.routePath,
            requireAuth: true,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'PaginaCalendario')
                : NavBarPage(
                    initialPage: 'PaginaCalendario',
                    page: PaginaCalendarioWidget(),
                  )),
        FFRoute(
            name: HistoriaClinicaWidget.routeName,
            path: HistoriaClinicaWidget.routePath,
            asyncParams: {
              'caballoSeleccionado':
                  getDoc(['Equino'], EquinoRecord.fromSnapshot),
              'historiaClinicaCaballoPARAM': getDoc(
                  ['Historia_Clinica'], HistoriaClinicaRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: HistoriaClinicaWidget(
                    caballoSeleccionado: params.getParam(
                      'caballoSeleccionado',
                      ParamType.Document,
                    ),
                    historiaClinicaCaballoPARAM: params.getParam(
                      'historiaClinicaCaballoPARAM',
                      ParamType.Document,
                    ),
                  ),
                )),
        FFRoute(
            name: HistorialVacunasWidget.routeName,
            path: HistorialVacunasWidget.routePath,
            asyncParams: {
              'caballoSelec': getDoc(['Equino'], EquinoRecord.fromSnapshot),
              'historiaclinica': getDoc(
                  ['Historia_Clinica'], HistoriaClinicaRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: HistorialVacunasWidget(
                    caballoSelec: params.getParam(
                      'caballoSelec',
                      ParamType.Document,
                    ),
                    hclinica: params.getParam(
                      'hclinica',
                      ParamType.DocumentReference,
                      isList: false,
                      collectionNamePath: ['Historia_Clinica'],
                    ),
                    historiaclinica: params.getParam(
                      'historiaclinica',
                      ParamType.Document,
                    ),
                  ),
                )),
        FFRoute(
            name: MarketModificarPublicacionWidget.routeName,
            path: MarketModificarPublicacionWidget.routePath,
            asyncParams: {
              'docPublicacion': getDoc(
                  ['Publicacion_Market'], PublicacionMarketRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: MarketModificarPublicacionWidget(
                    docPublicacion: params.getParam(
                      'docPublicacion',
                      ParamType.Document,
                    ),
                  ),
                )),
        FFRoute(
          name: Products111Widget.routeName,
          path: Products111Widget.routePath,
          builder: (context, params) => Products111Widget(),
        ),
        FFRoute(
          name: ProductsWidget.routeName,
          path: ProductsWidget.routePath,
          builder: (context, params) => ProductsWidget(),
        ),
        FFRoute(
          name: Products2222Widget.routeName,
          path: Products2222Widget.routePath,
          builder: (context, params) => Products2222Widget(),
        ),
        FFRoute(
          name: Details20PropertyWidget.routeName,
          path: Details20PropertyWidget.routePath,
          builder: (context, params) => Details20PropertyWidget(),
        ),
        FFRoute(
            name: PaginaEventoCalendarioWidget.routeName,
            path: PaginaEventoCalendarioWidget.routePath,
            requireAuth: true,
            asyncParams: {
              'evento': getDoc(
                  ['Evento_Calendario'], EventoCalendarioRecord.fromSnapshot),
              'listaEventosFechaSeleccionada': getDocList(
                  ['Evento_Calendario'], EventoCalendarioRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: PaginaEventoCalendarioWidget(
                    evento: params.getParam(
                      'evento',
                      ParamType.Document,
                    ),
                    fechaSeleccionada: params.getParam(
                      'fechaSeleccionada',
                      ParamType.DateTime,
                    ),
                    listaEventosFechaSeleccionada:
                        params.getParam<EventoCalendarioRecord>(
                      'listaEventosFechaSeleccionada',
                      ParamType.Document,
                      isList: true,
                    ),
                  ),
                )),
        FFRoute(
            name: PaginaEventosDeUnDiaWidget.routeName,
            path: PaginaEventosDeUnDiaWidget.routePath,
            requireAuth: true,
            asyncParams: {
              'listaEventosPARAM': getDocList(
                  ['Evento_Calendario'], EventoCalendarioRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: PaginaEventosDeUnDiaWidget(
                    fechaSeleccionada: params.getParam(
                      'fechaSeleccionada',
                      ParamType.DateTime,
                    ),
                    listaEventosPARAM: params.getParam<EventoCalendarioRecord>(
                      'listaEventosPARAM',
                      ParamType.Document,
                      isList: true,
                    ),
                  ),
                )),
        FFRoute(
          name: BudgetBalanceWidget.routeName,
          path: BudgetBalanceWidget.routePath,
          builder: (context, params) => BudgetBalanceWidget(),
        ),
        FFRoute(
            name: PaginaSeguimientoGastosWidget.routeName,
            path: PaginaSeguimientoGastosWidget.routePath,
            asyncParams: {
              'listaTransaccionesMesCorrientePARAM':
                  getDocList(['Transaccion'], TransaccionRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: PaginaSeguimientoGastosWidget(
                    listaTransaccionesMesCorrientePARAM:
                        params.getParam<TransaccionRecord>(
                      'listaTransaccionesMesCorrientePARAM',
                      ParamType.Document,
                      isList: true,
                    ),
                    balanceNetoPARAM: params.getParam(
                      'balanceNetoPARAM',
                      ParamType.double,
                    ),
                  ),
                )),
        FFRoute(
          name: Dashboard5Widget.routeName,
          path: Dashboard5Widget.routePath,
          builder: (context, params) => Dashboard5Widget(),
        ),
        FFRoute(
            name: PaginaNotificacionesWidget.routeName,
            path: PaginaNotificacionesWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: PaginaNotificacionesWidget(),
                )),
        FFRoute(
          name: Create05PatientIntakeWidget.routeName,
          path: Create05PatientIntakeWidget.routePath,
          builder: (context, params) => Create05PatientIntakeWidget(),
        ),
        FFRoute(
            name: NuevoVeterinarioCabeceraWidget.routeName,
            path: NuevoVeterinarioCabeceraWidget.routePath,
            asyncParams: {
              'caballoSeleccionado':
                  getDoc(['Equino'], EquinoRecord.fromSnapshot),
              'historiaClinicaCaballo': getDoc(
                  ['Historia_Clinica'], HistoriaClinicaRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: NuevoVeterinarioCabeceraWidget(
                    caballoSeleccionado: params.getParam(
                      'caballoSeleccionado',
                      ParamType.Document,
                    ),
                    historiaClinicaCaballo: params.getParam(
                      'historiaClinicaCaballo',
                      ParamType.Document,
                    ),
                  ),
                )),
        FFRoute(
            name: FichaVeterinarioWidget.routeName,
            path: FichaVeterinarioWidget.routePath,
            asyncParams: {
              'docVeterinario': getDoc(
                  ['MedicoVeterinario'], MedicoVeterinarioRecord.fromSnapshot),
              'caballoSeleccionado':
                  getDoc(['Equino'], EquinoRecord.fromSnapshot),
              'historiaClinicaCaballo': getDoc(
                  ['Historia_Clinica'], HistoriaClinicaRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: FichaVeterinarioWidget(
                    docVeterinario: params.getParam(
                      'docVeterinario',
                      ParamType.Document,
                    ),
                    caballoSeleccionado: params.getParam(
                      'caballoSeleccionado',
                      ParamType.Document,
                    ),
                    historiaClinicaCaballo: params.getParam(
                      'historiaClinicaCaballo',
                      ParamType.Document,
                    ),
                  ),
                )),
        FFRoute(
            name: VisitaVeterinariaWidget.routeName,
            path: VisitaVeterinariaWidget.routePath,
            asyncParams: {
              'caballoSeleccionado':
                  getDoc(['Equino'], EquinoRecord.fromSnapshot),
              'veterinarioDeLaVisita': getDoc(
                  ['MedicoVeterinario'], MedicoVeterinarioRecord.fromSnapshot),
              'visitaVeterinariaSeleccionada': getDoc(
                  ['VisitaVeterinaria'], VisitaVeterinariaRecord.fromSnapshot),
            },
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: VisitaVeterinariaWidget(
                    caballoSeleccionado: params.getParam(
                      'caballoSeleccionado',
                      ParamType.Document,
                    ),
                    veterinarioDeLaVisita: params.getParam(
                      'veterinarioDeLaVisita',
                      ParamType.Document,
                    ),
                    visitaVeterinariaSeleccionada: params.getParam(
                      'visitaVeterinariaSeleccionada',
                      ParamType.Document,
                    ),
                  ),
                ))
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/iniciarSesion';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
