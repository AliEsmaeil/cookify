import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wagba/features/basket/presentation/manager/basket_cubit.dart';

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCubit, BasketStates>(
      builder: (context, state) {
        var cubit = BasketCubit.getCubit(context);

        return Row(
            children: [
              Expanded(
                  child: Column(
                      children: [
                        Text('Total'),
                        Text(
                            '${cubit.totalPrice}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ]
                  )
              ),
              Expanded(
                child: FilledButton(onPressed: (){
                  //Todo: implement bottom sheet
                }, child: Text('Checkout')),
              ),
            ]
        );
      },
    );
  }
}
