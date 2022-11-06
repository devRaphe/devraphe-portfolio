import 'package:url_launcher/url_launcher.dart';

import '../base/faliure.dart';

class UrlLauncherService {
  Uri _phoneUri(String phoneNumber) {
    return Uri(scheme: 'tel', path: phoneNumber);
  }

  Uri _smsUri(String phoneNumber) {
    return Uri(scheme: 'sms', path: phoneNumber);
  }

  Uri _emailUri(String email) {
    return Uri(scheme: 'mailto', path: email);
  }

  Uri _webUri(String url) {
    return Uri.parse(url);
  }

  Future<void> launchPhone(String phoneNumber) async {
    try {
      final uri = _phoneUri(phoneNumber);
      await _launchUrl(uri);
    } catch (e, s) {
      throw Failure(
          devMessage: e.toString() + s.toString(),
          prettyMessage:
              'Opps unable to launch phone app, phone number has been copied to your clipboard for you convinence');
    }
  }

  Future<void> launchSms(String phoneNumber) async {
    try {
      final uri = _smsUri(phoneNumber);
      await _launchUrl(uri);
    } catch (e, s) {
      throw Failure(
          devMessage: e.toString() + s.toString(),
          prettyMessage:
              'Opps unable to launch sms app, sms text has been copied to your clipboard for you convinence');
    }
  }

  Future<void> launchEmail(String email) async {
    try {
      final uri = _emailUri(email);
      await _launchUrl(uri);
    } catch (e, s) {
      throw Failure(
          devMessage: e.toString() + s.toString(),
          prettyMessage:
              'Opps unable to launch email app, email has been copied to your clipboard for you convinence');
    }
  }

  Future<void> launchWeb(String url) async {
    try {
      final uri = _webUri(url);
      await _launchUrl(uri);
    } catch (e, s) {
      throw Failure(
          devMessage: e.toString() + s.toString(),
          prettyMessage:
              'Opps unable to launch website, website\'s url has been copied to your clipboard for you convinence');
    }
  }

  Future<void> _launchUrl(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
