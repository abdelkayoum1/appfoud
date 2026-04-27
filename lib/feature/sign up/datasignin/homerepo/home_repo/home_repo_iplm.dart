import 'package:appfoud/core/error/failure.dart';
import 'package:appfoud/feature/sign%20up/datasignin/homerepo/home_repo/home_repo.dart';
import 'package:appfoud/feature/sign%20up/datasignin/model/model_course.dart';
import 'package:appfoud/feature/sign%20up/datasignin/model/model_name.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:gotrue/src/types/user.dart';
import 'package:supabase/src/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepoIplm implements HomeRepo {
  SupabaseClient supabase = Supabase.instance.client;

  late User? usere;

  @override
  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      print(email);
      print(password);
      final reponse = await supabase.auth.signInWithPassword(
        email: email.trim(),
        password: password.trim(),
      );
      print(reponse.user);
      usere = reponse.user;
      if (usere != null) {
        return Right(null);
      } else {
        return Right(null);
      }
    } catch (e) {
      print(e);
      if (e is AuthException) {
        print(e.message);
        return Left(FailureServer(error: e.message));
      }
      return Left(FailureServer(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signUp({
    required String password,
    required String email,
    required String name,
  }) async {
    try {
      print('=== START SIGNUP ===');
      print('Email: ${email.trim()}');
      print('Password: ${password.trim()}');
      AuthResponse reponse = await supabase.auth.signUp(
        email: email.trim(),
        password: password.trim(),
        emailRedirectTo: null,
      );
      print('=== RESPONSE ===');
      print('User: ${reponse.user}');
      print('Session: ${reponse.session}');

      print('ajoiter succes');
      usere = reponse.user;
      if (usere != null) {
        await get(name: name, email: email);
        return Right(true);
      } else {
        return Right(false);
      }
    } catch (e) {
      if (e is AuthException) {
        return Left(FailureServer(error: e.message));
      }
      return Left(FailureServer(error: e.toString()));
    }
  }

  Future<Either<Failure, void>> get({
    required String name,
    required String email,
  }) async {
    try {
      final res = await supabase.from('users').insert({
        'id': usere!.id,
        'name': name.trim(),
        'email': email.trim(),
      });
      print('hi');
      return Right(null);
    } catch (e) {
      if (e is AuthException) {
        return Left(FailureServer());
      }
      return Left(FailureServer());
    }
  }

  @override
  Future<Either<Failure, List<ModelCourse>>> getcourse() async {
    try {
      List<ModelCourse> list = [];
      final res = await supabase.from('course').select();
      print(res.length);
      // list = [];
      for (var item in res) {
        list.add(ModelCourse.fromJson(item));
      }
      return Right(list);
    } catch (e) {
      if (e is AuthException) {
        return Left(FailureServer());
      }
      return Left(FailureServer());
    }
  }

  @override
  Future<Either<Failure, List<Modelname>>> getname() async {
    try {
      List<Modelname> list = [];
      final res = await supabase
          .from('users')
          .select('(*)')
          .eq('id', supabase.auth.currentUser!.id)
          .single();
      print(res.length);
      // list = [];
      // for (var item in res) {
      print(res);
      list.add(Modelname.fromJson(res));
      //}

      return Right(list);
    } catch (e) {
      if (e is AuthException) {
        return Left(FailureServer());
      }
      return Left(FailureServer());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await supabase.auth.signOut();
      return Right(null);
    } catch (e) {
      return Left(FailureServer(error: e.toString()));
    }
  }
}
