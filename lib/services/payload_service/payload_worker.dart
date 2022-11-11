/// All task type
enum PayloadType {
  /// A send task.
  ///
  /// Send messages or files from local machine to remote machine.
  send,

  /// A receive task
  ///
  /// Receive messages or files from remote machine to local machine.
  receive,
}

/// Task status
///
/// Check this to find worker status.
enum PayloadState {
  /// No task loaded, [sourcePath] or [type] is empty.
  notLoaded,

  /// Task loaded and waiting in task queue.
  waiting,

  /// Task is running and not finished.
  running,

  /// Task is completed
  finished,

  /// Task loaded, but stopped by user.
  ///
  /// May once in [running] state or not.
  terminated,

  /// Task is failed, due to some expected extern reasons.
  ///
  /// Network, remote down...
  /// Not stopped by user.
  failed,
}

/// Payload worker handling send and receive messages tasks.
///
/// Each instance handle one message task.
/// Controlled by PayloadService.
class PayloadWorker {
  /// Build from source info.
  ///
  /// With source (file path or text) and task type.
  PayloadWorker.fromSource(
      {required this.source, required this.type, required this.id});

  /// ID of worker.
  final int id;

  /// Source file path or messages.
  ///
  /// If working with files, it's a file url:
  /// * In send task, it's a local file path.
  /// * In receive task, it's a remote url remote machine can recognize.
  ///
  /// If working with messages, it's some text:
  /// * In send task, it's the message you want to send.
  /// * In receive task, it is empty string.
  final String source;

  /// Record type.
  final PayloadType type;
}
