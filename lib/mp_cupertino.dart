import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';

/// Scaffold.
class MpScaffold extends StatelessWidget {
  final Widget appBar;
  final Widget body;
  final Widget bottomNavigationBar;

  MpScaffold({this.appBar, @required this.body, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: this.appBar,
      child: Column(
        children: [
          Expanded(child: this.body),
          if (this.bottomNavigationBar != null) this.bottomNavigationBar
        ],
      ),
    );
  }
}

/// Page router.
PageRoute mpPageRoute({Widget Function(BuildContext) builder}) {
  return CupertinoPageRoute(
    builder: builder,
  );
}

/// AppBar.
class MpAppBar extends StatelessWidget
    implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  final Widget title;
  final Widget button;

  @override
  final Size preferredSize;

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor = CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }

  MpAppBar({
    this.title,
    this.button,
    this.preferredSize = const Size.fromHeight(56.0),
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: title,
      trailing: (button != null) ? button : SizedBox(),
    );
  }
}

/// Button.
class MpButton extends StatelessWidget {
  MpButton({this.label, this.onPressed});
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      child: Text(label),
      onPressed: onPressed,
    );
  }
}

/// Link button.
class MpLinkButton extends StatelessWidget {
  MpLinkButton({this.label, this.onPressed});
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsetsDirectional.zero,
      child: Text(label),
      onPressed: onPressed,
    );
  }
}

/// Round button with icon.
class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    this.icon,
    this.fillColor,
    @required this.onPressed,
  });

  final IconData icon;
  final Function onPressed;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Icon(icon),
      onPressed: onPressed,
      // elevation: 0.0,
      // constraints: BoxConstraints.tightFor(
      //   width: 56.0,
      //   height: 56.0,
      // ),
      // shape: CircleBorder(),
      // fillColor: this.fillColor,
    );
  }
}

/// FlatButton.
class MpFlatButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final EdgeInsetsGeometry padding;
  final Widget child;

  MpFlatButton({
    this.label,
    this.onPressed,
    this.padding,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: padding,
      onPressed: onPressed,
      child: child,
    );
  }
}

/// Text field.
class MpTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final List<TextInputFormatter> inputFormatters;
  final bool readOnly;

  MpTextField({
    @required this.controller,
    this.labelText,
    this.inputFormatters,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(labelText),
        SizedBox(
          height: 8.0,
        ),
        CupertinoTextField(
          controller: controller,
          inputFormatters: inputFormatters,
          readOnly: readOnly,
        ),
      ],
    );
  }
}

/// Switch.
class MpSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Function onTap;

  MpSwitch(
      {@required this.title,
      @required this.value,
      @required this.onChanged,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(title),
        ),
        Expanded(
          flex: 1,
          child: CupertinoSwitch(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

/// Validation message.
class MpValidationMessage extends StatelessWidget {
  final String message;

  MpValidationMessage({@required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(
            this.message,
            textScaleFactor: 0.8,
            style: TextStyle(color: CupertinoColors.destructiveRed),
          ),
        ],
      ),
    );
  }
}

/// Radio selector
// ignore: todo
//TODO: Delete it.
Widget mpSelectFromTwo({
  BuildContext context,
  @required dynamic value1,
  @required dynamic value2,
  @required dynamic groupValue,
  @required void Function(dynamic) onChanged,
  @required String itemText1,
  @required String itemText2,
}) {
  return CupertinoRadioChoice(
      choices: {value1: itemText1, value2: itemText2},
      onChange: onChanged,
      initialKeyValue: groupValue);
}

/// GroupSelect(Radio)
/// class NativeGroupSelect<T> from native_widgets
class MpGroupSelect<T> extends StatelessWidget {
  final ValueChanged<T> onValueChanged;
  final Map<T, Widget> children;
  final T groupValue;

  MpGroupSelect({
    Key key,
    this.onValueChanged,
    @required this.groupValue,
    @required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSegmentedControl<T>(
      children: children,
      onValueChanged: onValueChanged,
      groupValue: groupValue,
    );
  }
}

// ListTile
class MpListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;
  final Function onTap;
  final Function onLongPress;

  MpListTile({
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      leading: this.leading,
      title: this.title,
      subtitle: this.subtitle,
      trailing: this.trailing,
      onTap: this.onTap,
      onLongPress: this.onLongPress,
    );
  }
}

Future<T> mpModalPopup<T>({
  BuildContext context,
  Widget child,
}) {
  return showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => child,
  );
}
