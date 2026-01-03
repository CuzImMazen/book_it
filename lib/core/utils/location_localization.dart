import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

String localizedGovernorate(BuildContext context, String governorate) {
  switch (governorate) {
    case "All":
      return context.home.all;
    case "Damascus":
      return context.home.damascus;
    case "Rural Damascus":
      return context.home.ruralDamascus;
    case "Aleppo":
      return context.home.aleppo;
    case "Idlib":
      return context.home.idlib;
    case "Homs":
      return context.home.homs;
    case "Hama":
      return context.home.hama;
    case "Latakia":
      return context.home.latakia;
    case "Tartus":
      return context.home.tartus;
    case "Sweidah":
      return context.home.sweidah;
    case "Dara'a":
      return context.home.daraa;
    case "Hassakeh":
      return context.home.hassakeh;
    case "Deir Alzoor":
      return context.home.deirAlzoor;
    case "Alraqqa":
      return context.home.alraqqa;
    case "AlQuneitra":
      return context.home.alQuneitra;
    default:
      return governorate;
  }
}

String localizedCity(BuildContext context, String? governorate, String city) {
  switch (governorate) {
    case "Damascus":
      switch (city) {
        case "Al-Qadam":
          return context.home.damascus_alQadam;
        case "Mazzeh":
          return context.home.damascus_mazzeh;
        case "Al-Salihiyah":
          return context.home.damascus_alSalihiyah;
        case "Baramkeh":
          return context.home.damascus_baramkeh;
        case "Al-Zahra":
          return context.home.damascus_alZahra;
      }
      break;
    case "Rural Damascus":
      switch (city) {
        case "Douma":
          return context.home.ruralDamascus_douma;
        case "Harasta":
          return context.home.ruralDamascus_harasta;
        case "Saidnaya":
          return context.home.ruralDamascus_saidnaya;
        case "Zabadani":
          return context.home.ruralDamascus_zabadani;
        case "Al-Tall":
          return context.home.ruralDamascus_alTall;
      }
      break;
    case "Aleppo":
      switch (city) {
        case "Azaz":
          return context.home.aleppo_azaz;
        case "Al-Bab":
          return context.home.aleppo_alBab;
        case "Manbij":
          return context.home.aleppo_manbij;
        case "Jarabulus":
          return context.home.aleppo_jarabulus;
        case "Al-Sukkari":
          return context.home.aleppo_alSukkari;
      }
      break;
    case "Idlib":
      switch (city) {
        case "Maarat al-Numan":
          return context.home.idlib_maaratAlNuman;
        case "Jisr al-Shughur":
          return context.home.idlib_jisrAlShughur;
        case "Ariha":
          return context.home.idlib_ariha;
        case "Saraqib":
          return context.home.idlib_saraqib;
      }
      break;
    case "Homs":
      switch (city) {
        case "Al-Rastan":
          return context.home.homs_alRastan;
        case "Al-Qusayr":
          return context.home.homs_alQusayr;
        case "Talbiseh":
          return context.home.homs_talbiseh;
        case "Tadmur":
          return context.home.homs_tadmur;
      }
      break;
    case "Hama":
      switch (city) {
        case "Masyaf":
          return context.home.hama_masyaf;
        case "Salamiyah":
          return context.home.hama_salamiyah;
        case "Mahardah":
          return context.home.hama_mahardah;
        case "Suran":
          return context.home.hama_suran;
      }
      break;
    case "Latakia":
      switch (city) {
        case "Jableh":
          return context.home.latakia_jableh;
        case "Qardaha":
          return context.home.latakia_qardaha;
        case "Al-Haffah":
          return context.home.latakia_alHaffah;
        case "Rabia":
          return context.home.latakia_rabia;
      }
      break;
    case "Tartus":
      switch (city) {
        case "Baniyas":
          return context.home.tartus_baniyas;
        case "Safita":
          return context.home.tartus_safita;
        case "Al-Shaykh Badr":
          return context.home.tartus_alShaykhBadr;
        case "Duraykish":
          return context.home.tartus_duraykish;
      }
      break;
    case "Sweidah":
      switch (city) {
        case "Shahba":
          return context.home.sweidah_shahba;
        case "Sahwat al-Khudr":
          return context.home.sweidah_sahwatAlKhudr;
        case "Shaqqa":
          return context.home.sweidah_shaqqa;
        case "Rweished":
          return context.home.sweidah_rweished;
      }
      break;
    case "Dara'a":
      switch (city) {
        case "Da'el":
          return context.home.daraa_dael;
        case "Nawa":
          return context.home.daraa_nawa;
        case "Izraa":
          return context.home.daraa_izraa;
        case "Al-Shajara":
          return context.home.daraa_alShajara;
      }
      break;
    case "Hassakeh":
      switch (city) {
        case "Qamishli":
          return context.home.hassakeh_qamishli;
        case "Amuda":
          return context.home.hassakeh_amuda;
        case "Al-Malikiyah":
          return context.home.hassakeh_alMalikiyah;
        case "Ras al-Ayn":
          return context.home.hassakeh_rasAlAyn;
      }
      break;
    case "Deir Alzoor":
      switch (city) {
        case "Al-Mayadin":
          return context.home.deirAlzoor_alMayadin;
        case "Al-Busayrah":
          return context.home.deirAlzoor_alBusayrah;
        case "Al-Shuhayl":
          return context.home.deirAlzoor_alShuhayl;
        case "Al-Kasrah":
          return context.home.deirAlzoor_alKasrah;
      }
      break;
    case "Alraqqa":
      switch (city) {
        case "Al-Thawrah":
          return context.home.alraqqa_alThawrah;
        case "Al-Mansurah":
          return context.home.alraqqa_alMansurah;
        case "Al-Resafa":
          return context.home.alraqqa_alResafa;
        case "Al-Hurriya":
          return context.home.alraqqa_alHurriya;
      }
      break;
    case "AlQuneitra":
      switch (city) {
        case "Fiq":
          return context.home.alQuneitra_fiq;
        case "Buqata":
          return context.home.alQuneitra_buqata;
        case "Kafr Shams":
          return context.home.alQuneitra_kafrShams;
      }
      break;
    default:
      return city;
  }
  return city;
}
