import 'package:flutter/material.dart';
import 'package:monitoring/data/monitoring_db.dart';
import 'package:provider/provider.dart';
import 'package:monitoring/models/models.dart';

/// A dropdown button form field, requires text controler [_controller],
/// a label [_label] and a list of strings to be used [_listValues].
class CustomDropdownSessionField extends StatefulWidget {
  const CustomDropdownSessionField({
    Key? key,
    required TextEditingController sessionController,
    required String txtLabel,
    required List<SessionLocationViewData> sessionData,
  })  : _sessionController = sessionController,
        _label = txtLabel,
        _sessionData = sessionData,
        super(key: key);

  final TextEditingController _sessionController;
  final String _label;
  final List<SessionLocationViewData> _sessionData;

  @override
  State<CustomDropdownSessionField> createState() =>
      _CustomDropdownSessionFieldState();
}

class _CustomDropdownSessionFieldState
    extends State<CustomDropdownSessionField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RingDataManager>(
      builder: (context, dataManager, child) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: DropdownButtonFormField(
              icon: const Icon(Icons.arrow_downward),
              value: widget._sessionController.text,
              decoration: InputDecoration(
                // Filled changes the color of the field
                //filled: true,
                labelText: widget._label,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '${widget._label} cannot be empty!';
                }
                return null;
              },
              menuMaxHeight: 200.0,
              onChanged: (String? value) {
                setState(() {
                  widget._sessionController.text = value!;
                });
                setResponses(dataManager, value!);
              },
              items: _getSessions(widget._sessionData)
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  // Show date and location only
                  child: Text(
                    value == '' ? value : value.split(',').skip(3).join(' - '),
                  ),
                );
              }).toList()),
        );
      },
    );
  }

  /// Creates a list of ringer's sessions as strings.
  List<String> _getSessions(List<SessionLocationViewData> list) {
    List<String> sessions = [''];
    for (var element in list) {
      String session =
          '${element.id}, ${element.locationCountry}, ${element.locationId}, ${element.date}, ${element.locationLocality ?? ''}';
      sessions.add(session);
    }
    //debugPrint('In ring_data_manager, _updateRingerSessions: $sessions');
    return sessions;
  }

  void setResponses(RingDataManager dataManager, String session) {
    if (session == '') {
      // On deselecting session, drop current session id.
      dataManager.setCurrentSessionId(-1);
      // On deselecting session, drop current location id.
      dataManager.setCurrentLocationId(-1);
      // On deselecting session, set session tapped to false.
      dataManager.setSessionTapped(false);
      // On deselecting session, drop session country.
      dataManager.setCountry('');
    } else {
      int sessionId = int.tryParse(session.split(',').first) ?? -1;
      int locationId = int.tryParse(session.split(',')[2]) ?? -1;
      String country = session.split(',')[1].trim();
      // On selecting session, get stream of session, location data.
      dataManager.getSessionLocationById(sessionId);
      // On selecting session, set current session id.
      dataManager.setCurrentSessionId(sessionId);
      // On selecting session, set country to session country.
      dataManager.setCountry(country);
      // On selecting session, set location id to session's location.
      dataManager.setCurrentLocationId(locationId);
      // On selecting session, get session's rings.
      dataManager.getSessionRingStream(sessionId);
      // On selecting session, get session's retraps.
      dataManager.getSessionRetrapStream(sessionId);
      // On selecting session, set session tapped to true.
      dataManager.setSessionTapped(true);
    }
  }
}
