#ifndef RUNNER_FLUTTER_WINDOW_H_
#define RUNNER_FLUTTER_WINDOW_H_

#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>

#include <memory>

#include "run_loop.h"
#include "win32_window.h"


class FlutterWindow : public Win32Window {
 public:
  
  
  explicit FlutterWindow(RunLoop* run_loop,
                         const flutter::DartProject& project);
  virtual ~FlutterWindow();

 protected:
  
  bool OnCreate() override;
  void OnDestroy() override;
  LRESULT MessageHandler(HWND window, UINT const message, WPARAM const wparam,
                         LPARAM const lparam) noexcept override;

 private:
  
  RunLoop* run_loop_;

  
  flutter::DartProject project_;

  
  std::unique_ptr<flutter::FlutterViewController> flutter_controller_;
};

#endif  
