const findPlanetsSync = (earthDay, marsDay) => {
  let daysToSync = 0;
  while ((earthDay % 365) !== (marsDay % 687)) {
    earthDay++;
    marsDay++;
    daysToSync++;
  }
  return daysToSync;
}
exports.findPlanetsSync = findPlanetsSync;
