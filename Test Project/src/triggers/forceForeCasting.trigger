trigger forceForeCasting on User (before insert) {
    for (User userInLoop : Trigger.new) {
        userInLoop.ForecastEnabled = true;
    }
}