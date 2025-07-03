

import 'package:easy_localization/easy_localization.dart';
import 'package:isar/isar.dart';

import '../../utils/date_utils.dart';

class GeneralModel {
  GeneralModel({
    this.created,
    this.createdInEpsilon,
    this.createdOffline,
    this.updated,
    this.hasSynced,
    this.lastPulledTime,
    this.errorMessage,
  });

  @Index()
  String? created = "";

  @Index(type: IndexType.value)
  int? createdInEpsilon;

  String? createdOffline = "";
  String? lastPulledTime = "";
  String? errorMessage = "";

  @Index()
  String? updated = "";

  bool? hasSynced = true;

  void setSynced(bool status) => hasSynced = status;
  void setErrorMessage(String message) => errorMessage = message;

  String getLastPulledTime() {
    String time = lastPulledTime != null && lastPulledTime!.isNotEmpty
        ? DateAndTimeUtil.dayMonthYear(lastPulledTime!)
        : "N/A";
    return "last_pulled".tr(args: [time]);
  }

  String getUpdated() {
    return updated != null && updated!.isNotEmpty
        ? DateAndTimeUtil.dayMonthYear(updated!)
        : "N/A";
  }

  String getCreatedOffline() {
    return createdOffline != null
        ? DateAndTimeUtil.dayMonthYear(createdOffline!)
        : DateAndTimeUtil.dayMonthYear(created!);
  }


  String getDateLabel() {
    return created != null
        ? DateAndTimeUtil.readableDate(created ?? '')
        : (created != null ? DateAndTimeUtil.readableDate(created!) : "");
  }

  String getTimeLabel() {
    return created != null
        ? DateAndTimeUtil.time(created ?? '')
        : (created != null ? DateAndTimeUtil.time(created!) : "");
  }

  String getReadableCreated() {
    return created != null
        ? DateAndTimeUtil.timeDate(created ?? '')
        : (created != null ? DateAndTimeUtil.timeDate(created!) : "");
  }

  String getReadableUpdated() {
    return updated != null
        ? DateAndTimeUtil.timeDate(updated!)
        : (created != null ? DateAndTimeUtil.timeDate(created!) : "");
  }

  String getCreated() {
    return createdOffline != null
        ? DateAndTimeUtil.readableDate(createdOffline ?? '')
        : (created != null ? DateAndTimeUtil.readableDate(created!) : "");
  }
}
