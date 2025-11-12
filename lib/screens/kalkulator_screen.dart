import 'package:flutter/material.dart';

class KalkulatorScreen extends StatefulWidget {
  const KalkulatorScreen({super.key});

  @override
  State<KalkulatorScreen> createState() => _KalkulatorScreenState();
}

class _KalkulatorScreenState extends State<KalkulatorScreen> {
  String _display = '0';
  String _expression = '';
  String _currentNumber = '';
  String _operation = '';
  double _firstOperand = 0;
  bool _shouldResetDisplay = false;

  void _onNumberPressed(String number) {
    setState(() {
      if (_shouldResetDisplay) {
        _display = number;
        _currentNumber = number;
        _shouldResetDisplay = false;
      } else {
        if (_currentNumber.isEmpty && _operation.isNotEmpty) {
          _display = number;
          _currentNumber = number;
          _expression += number;
        } else if (_display == '0' || _currentNumber.isEmpty) {
          _display = number;
          _currentNumber = number;
          if (_operation.isEmpty) {
            _expression = number;
          } else {
            _expression += number;
          }
        } else {
          _display += number;
          _currentNumber += number;
          _expression += number;
        }
      }
    });
  }

  void _onDecimalPressed() {
    setState(() {
      if (_shouldResetDisplay) {
        _display = '0.';
        _currentNumber = '0.';
        _expression = '0.';
        _shouldResetDisplay = false;
      } else if (!_currentNumber.contains('.')) {
        if (_currentNumber.isEmpty) {
          _display = '0.';
          _currentNumber = '0.';
          if (_operation.isNotEmpty) {
            _expression += '0.';
          } else {
            _expression = '0.';
          }
        } else {
          _display += '.';
          _currentNumber += '.';
          _expression += '.';
        }
      }
    });
  }

  void _onOperationPressed(String op) {
    setState(() {
      if (_currentNumber.isNotEmpty) {
        if (_operation.isNotEmpty) {
          double secondOperand = double.parse(_currentNumber);
          double result = 0;

          switch (_operation) {
            case '+':
              result = _firstOperand + secondOperand;
              break;
            case '−':
              result = _firstOperand - secondOperand;
              break;
            case '×':
              result = _firstOperand * secondOperand;
              break;
            case '÷':
              if (secondOperand != 0) {
                result = _firstOperand / secondOperand;
              } else {
                result = _firstOperand;
              }
              break;
          }

          _firstOperand = result;
          _display = _formatNumber(result);
          _expression = '${_formatNumber(result)} $op ';
        } else {
          _firstOperand = double.parse(_currentNumber);
          _expression = '${_formatNumber(_firstOperand)} $op ';
        }

        _operation = op;
        _currentNumber = '';
      } else if (_operation.isNotEmpty) {
        _operation = op;
        _expression = '${_formatNumber(_firstOperand)} $op ';
      }
    });
  }

  void _onEqualsPressed() {
    setState(() {
      if (_currentNumber.isNotEmpty && _operation.isNotEmpty) {
        double secondOperand = double.parse(_currentNumber);
        double result = 0;

        switch (_operation) {
          case '+':
            result = _firstOperand + secondOperand;
            break;
          case '−':
            result = _firstOperand - secondOperand;
            break;
          case '×':
            result = _firstOperand * secondOperand;
            break;
          case '÷':
            if (secondOperand != 0) {
              result = _firstOperand / secondOperand;
            } else {
              _display = 'Error';
              _expression = '';
              _currentNumber = '';
              return;
            }
            break;
        }

        _expression =
            '${_formatNumber(_firstOperand)} $_operation ${_formatNumber(secondOperand)}';
        _display = _formatNumber(result);
        _currentNumber = _formatNumber(result);
        _operation = '';
        _firstOperand = result;
        _shouldResetDisplay = true;
      }
    });
  }

  void _onClearPressed() {
    setState(() {
      _display = '0';
      _expression = '';
      _currentNumber = '';
      _operation = '';
      _firstOperand = 0;
      _shouldResetDisplay = false;
    });
  }

  void _onPlusMinusPressed() {
    setState(() {
      if (_currentNumber.isNotEmpty) {
        double number = double.parse(_currentNumber);
        number = -number;
        _currentNumber = _formatNumber(number);
        _display = _currentNumber;
        if (_operation.isEmpty) {
          _expression = _currentNumber;
        }
      } else if (_display != '0') {
        double number = double.parse(_display);
        number = -number;
        _display = _formatNumber(number);
      }
    });
  }

  void _onPercentPressed() {
    setState(() {
      if (_currentNumber.isNotEmpty) {
        double number = double.parse(_currentNumber);
        number = number / 100;
        _currentNumber = _formatNumber(number);
        _display = _currentNumber;
        if (_operation.isEmpty) {
          _expression = _currentNumber;
        }
      }
    });
  }

  String _formatNumber(double number) {
    if (number == number.toInt()) {
      return number.toInt().toString();
    }
    return number.toStringAsFixed(2).replaceAll(RegExp(r'\.?0+$'), '');
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    Color? bgColor,
    bool isGradient = false,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: GestureDetector(
          onTapDown: (_) => setState(() {}),
          onTapUp: (_) {
            setState(() {});
            onPressed();
          },
          onTapCancel: () => setState(() {}),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              gradient: isGradient
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF5936B4), Color(0xFF362A84)],
                    )
                  : null,
              color: isGradient ? null : bgColor ?? const Color(0xFFFF69B4),
              border: Border.all(color: const Color(0xFF222222), width: 4),
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF000000),
                  offset: Offset(4, 4),
                  blurRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9D5FF),
                  border: Border.all(color: const Color(0xFF222222), width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF000000),
                      offset: Offset(4, 4),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Kalkulator',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF222222),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Display
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFF99),
                  border: Border.all(color: const Color(0xFF222222), width: 4),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x80000000),
                      offset: Offset(6, 6),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 32,
                      child: Text(
                        _expression.isEmpty ? '' : _expression,
                        style: const TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      _display,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 56,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Button Grid
              Expanded(
                child: Column(
                  children: [
                    // Row 1
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton(text: 'AC', onPressed: _onClearPressed),
                          _buildButton(
                            text: '+/-',
                            onPressed: _onPlusMinusPressed,
                          ),
                          _buildButton(text: '%', onPressed: _onPercentPressed),
                          _buildButton(
                            text: '÷',
                            onPressed: () => _onOperationPressed('÷'),
                            bgColor: const Color(0xFF0000FF),
                          ),
                        ],
                      ),
                    ),
                    // Row 2
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton(
                            text: '7',
                            onPressed: () => _onNumberPressed('7'),
                          ),
                          _buildButton(
                            text: '8',
                            onPressed: () => _onNumberPressed('8'),
                          ),
                          _buildButton(
                            text: '9',
                            onPressed: () => _onNumberPressed('9'),
                          ),
                          _buildButton(
                            text: '×',
                            onPressed: () => _onOperationPressed('×'),
                            bgColor: const Color(0xFF0000FF),
                          ),
                        ],
                      ),
                    ),
                    // Row 3
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton(
                            text: '4',
                            onPressed: () => _onNumberPressed('4'),
                          ),
                          _buildButton(
                            text: '5',
                            onPressed: () => _onNumberPressed('5'),
                          ),
                          _buildButton(
                            text: '6',
                            onPressed: () => _onNumberPressed('6'),
                          ),
                          _buildButton(
                            text: '−',
                            onPressed: () => _onOperationPressed('−'),
                            bgColor: const Color(0xFF0000FF),
                          ),
                        ],
                      ),
                    ),
                    // Row 4
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton(
                            text: '1',
                            onPressed: () => _onNumberPressed('1'),
                          ),
                          _buildButton(
                            text: '2',
                            onPressed: () => _onNumberPressed('2'),
                          ),
                          _buildButton(
                            text: '3',
                            onPressed: () => _onNumberPressed('3'),
                          ),
                          _buildButton(
                            text: '+',
                            onPressed: () => _onOperationPressed('+'),
                            bgColor: const Color(0xFF0000FF),
                          ),
                        ],
                      ),
                    ),
                    // Row 5
                    Expanded(
                      child: Row(
                        children: [
                          _buildButton(
                            text: '0',
                            onPressed: () => _onNumberPressed('0'),
                            flex: 2,
                          ),
                          _buildButton(text: '.', onPressed: _onDecimalPressed),
                          _buildButton(
                            text: '=',
                            onPressed: _onEqualsPressed,
                            isGradient: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
