enum ApplicationMessages {
  serverError(
    "Server error occurred. Our team has been notified and is working on a fix.",
  ),
  networkError(
    "Unable to connect to server. Please check your internet connection and try again.",
  ),
  authenticationError(
    "Invalid username or password. Please check your credentials and try again.",
  ),
  generalError("An unexpected error occurred. Please try again later."),
  waitingForApproval(
    'Your appointment is currently pending and waiting for approval!',
  ),
  badRequestError("Bad request. Please check your input and try again."),
  selectReason("Please select a reason for your appointment."),
  noUpcomingAppointments("No upcoming appointments found."),
  failedToRetrieveData("Data error occurred, Failed to get data from server");

  const ApplicationMessages(this.message);
  final String message;
}
