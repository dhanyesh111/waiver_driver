enum DropDownState { hidden, loading, loaded }

enum ImageState { empty, loading, uploaded }

enum ChauffeurProofApprovalStatus { notUpload, waitingForApproval, approved }

enum DriverState {
  idle,
  goingToPickUp,
  arrivedAtPickUp,
  goingToDestination,
  pauseTrip,
  reachedDestination
}
