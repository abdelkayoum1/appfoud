import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Supabasee {
  static final baseurl = 'https://ssykuvjpnvjzffyodkiw.supabase.co';
  static final key = 'sb_publishable_NqAAlGXa1xdMYZdVTOWWdA_Yfu91H9r';
  // final SupabaseClient supabaseClient=Supabase.in
  // ignore: strict_top_level_inference
  static init() {
    Supabase.initialize(url: baseurl, anonKey: key);
  }
}
