* turn procedure
    * every turn, per bot
      * starts timer
        * after KILL_TIMEOUT, kill bot with "timed out" and shut down worker
      * if bot.giveWarning flag is set:
        * if bot.warningCount > MAX_WARNINGS:
          * kill bot with "warnings exceeded" and shut down worker
        * call bot.giveTimeoutWarning(bot.warningCount)
        * clear bot.giveWarning flag
      * engine calls bot.currentSituation
      * bot calls engine.respondToSituation
        * stop timer
        * if timer > WARNING_TIMEOUT:
          * bot.warningCount++
          * set bot.giveWarning flag
    * after all bots have run:
      * if any bot.HP <= 0:
        * kill bot with "dead" and shut down worker
      * if only one bot alive:
        * set winner flag on bot
        * set loser flag on all other bots
        * resolve game; shut down all workers
