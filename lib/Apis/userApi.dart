import 'dart:async';

import 'package:application_project/Apis/pictures.dart';
import 'package:application_project/Apis/remoteservices.dart';
import 'package:application_project/Apis/users.dart';
import 'package:flutter/material.dart';

class UserApi extends StatefulWidget {
  const UserApi({super.key});

  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {
  List<Users>? posts;
  List<Pictures>? pics;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
    getphotos();
  }

  getData() async {
    posts = await RemoteServices().getPosts();
    if (posts != null) {
      Timer(const Duration(seconds: 3), () {
        setState(() {
          isLoaded = true;
        });
      });
    }
  }

  getphotos() async {
    pics = (await RemoteServicesApi().getPics()) as List<Pictures>?;
    if (posts != null) {
      Timer(const Duration(seconds: 3), () {
        setState(() {
          isLoaded = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            replacement: Center(
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/cycle.gif')),
            ),
            visible: isLoaded,
            child: Expanded(
              child: ListView.builder(
                itemCount: posts?.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(7),
                    child: Card(
                      elevation: 35,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(26.0),
                              child: Row(
                                children: [
                                  pics == null
                                      ? const CircularProgressIndicator()
                                      : SizedBox(
                                          height: 80,
                                          width: 80,
                                          // child: Image.asset(
                                          //   'assets/images/cycle.gif',
                                          //   width: 80,
                                          //   height: 80,
                                          //   fit: BoxFit.fill,
                                          // )
                                          child: Image.network(
                                              pics![index].largeImageUrl),
                                        ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Id:",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        posts![index].id.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepPurple),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "User Name:",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              posts![index].username,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.redAccent),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Name:",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              width: 35,
                                            ),
                                            Text(
                                              posts![index].name,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueGrey),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "email:",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              width: 35,
                                            ),
                                            Text(
                                              posts![index].email,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.redAccent),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Address:",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "City:${posts![index].address.city}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                ),
                                                Text(
                                                  posts![index].address.street,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                ),
                                                Text(
                                                  posts![index].address.suite,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                ),
                                                Text(
                                                  posts![index].address.zipcode,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Company:",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  posts![index].company.name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                ),
                                                Text(
                                                  posts![index].company.bs,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                ),
                                                Text(
                                                  posts![index]
                                                      .company
                                                      .catchPhrase,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            )
                                          ],
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
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
