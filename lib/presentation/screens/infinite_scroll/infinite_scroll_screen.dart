import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  const InfiniteScrollScreen({Key? key}) : super(key: key);

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imageId = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        //load next page
        loadNextPage();
      }
      
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    isMounted = false;
  }

  Future loadNextPage() async{
    if(isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;
    
    //revisar si está montado el componente / widget
    if (!isMounted) return;
    setState(() {});
    //Mover Scroll bottom
    moveScrollToBottom();
    
  }

  Future<void> onRefresh() async{
    
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;
    isLoading = false;
    final idLast = imageId.last;
    imageId.clear();
    imageId.add(idLast+1);
    addFiveImages();
    setState(() {});
    
  }

  void moveScrollToBottom(){
    if (scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels+100, 
      duration: const Duration(seconds: 3), 
      curve: Curves.bounceInOut
    );
  }

  void addFiveImages(){
    final lasId = imageId.last;
    imageId.addAll(
      [1,2,3,4,5].map((e) => lasId + e)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
       body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
         child: RefreshIndicator(
           onRefresh: onRefresh,
           edgeOffset: 10,
           strokeWidth: 2,
           child: ListView.builder(
            controller: scrollController,
            itemCount: imageId.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${ imageId[index] }/500/300')
              );
              
            },
               ),
         ),
       ),
       floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
        ? SpinPerfect(
            infinite: true,
            child: const Icon(Icons.refresh_outlined)
          )
        :const Icon(Icons.arrow_back_ios_new)
      ),
    );
  }
}