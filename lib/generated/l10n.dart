// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `电话号码`
  String get phone_number {
    return Intl.message(
      '电话号码',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `请输入`
  String get plese_input {
    return Intl.message(
      '请输入',
      name: 'plese_input',
      desc: '',
      args: [],
    );
  }

  /// `验证码`
  String get vCode {
    return Intl.message(
      '验证码',
      name: 'vCode',
      desc: '',
      args: [],
    );
  }

  /// `获取验证码`
  String get getVCode {
    return Intl.message(
      '获取验证码',
      name: 'getVCode',
      desc: '',
      args: [],
    );
  }

  /// `验证码发送成功`
  String get code_send_success {
    return Intl.message(
      '验证码发送成功',
      name: 'code_send_success',
      desc: '',
      args: [],
    );
  }

  /// `登录`
  String get login {
    return Intl.message(
      '登录',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `《隐私政策》`
  String get pp {
    return Intl.message(
      '《隐私政策》',
      name: 'pp',
      desc: '',
      args: [],
    );
  }

  /// `我已仔细阅读并同意遵守:`
  String get rade_success {
    return Intl.message(
      '我已仔细阅读并同意遵守:',
      name: 'rade_success',
      desc: '',
      args: [],
    );
  }

  /// `发送验证码成功！`
  String get send_success {
    return Intl.message(
      '发送验证码成功！',
      name: 'send_success',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
