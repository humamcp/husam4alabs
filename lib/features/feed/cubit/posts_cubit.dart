import 'package:bloc/bloc.dart';
import 'package:husam4alabs/features/feed/model/post.dart';

///
/// Manage Post State
///
class PostCubit extends Cubit<List<Post>> {
  PostCubit() : super([]);
  bool isInit = false;

  ///
  /// toggle Post active status
  ///
  Future<void> togglePost(int id, {required bool isActive}) async {
    // TODO: check if user logged in else -> go to login page
    // ...

    // update list
    final nstate = [...state];
    nstate.firstWhere((element) => element.id == id).isSaved = isActive;

    // TODO: in real app call api request for adding Post
    await Future.delayed(const Duration(milliseconds: 250));

    // update the state
    emit(nstate);
  }

  ///
  /// init Post list for user
  ///
  Future<void> init() async {
    // check if already initalized
    if (!isInit) {
      isInit = true;
    } else {
      return;
    }

    // TODO: check if user logged in else -> go to login page
    // ...

    // TODO: in real app call api request for adding Post
    await Future.delayed(const Duration(seconds: 1));

    // update the state
    emit([]);
  }

  ///
  /// Add Post for user
  ///
  Future<void> addPost(Post model) async {
    // TODO: check if user logged in else -> go to login page
    // ...

    // TODO: in real app call api request for adding Post
    await Future.delayed(const Duration(milliseconds: 500));

    // update the state
    emit([...state, model]);
  }

  ///
  /// Remove User Post
  ///
  Future<void> removePost(Post model) async {
    // TODO: check if user logged in else -> go to login page
    // ...

    // TODO: in real app call api request for deleting Post
    await Future.delayed(const Duration(milliseconds: 300));

    // update the state
    final nstate = state.where((el) => el.id != model.id).toList();
    // nstate.removeWhere((element) => element.id == model.id);
    emit(nstate);
  }
}
