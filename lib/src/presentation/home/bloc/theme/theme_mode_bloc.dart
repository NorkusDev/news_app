import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/src/core/helpers/helper_storage.dart';

part 'theme_mode_event.dart';
part 'theme_mode_state.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  final StorageHelper storage;

  ThemeModeBloc({
    required this.storage,
  }) : super(const ThemeModeState()) {
    on<ThemeModeEvent>((event, emit) {});
    on<ChangeThemeModeEvent>(_changeThemeModeEvent);
    on<ReadThemeModeEvent>(_readThemeModeEvent);
  }

  void _changeThemeModeEvent(
      ThemeModeEvent event, Emitter<ThemeModeState> emit) async {
    bool value = !state.isDarkMode;
    await storage.write(
      StorageItems(
        key: "theme",
        value: value.toString(),
      ),
    );

    emit(state.copyWith(isDarkMode: value));
    return;
  }

  void _readThemeModeEvent(
      ThemeModeEvent event, Emitter<ThemeModeState> emit) async {
    String theme = await storage.read('theme') ?? "false";
    emit(
      state.copyWith(isDarkMode: theme == "true" ? true : false),
    );
    return;
  }
}
