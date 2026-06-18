import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/features/home/data/categories_data.dart';
import 'package:skill_swap/features/home/data/mentor_data.dart';
import 'package:skill_swap/features/home/models/categories_model.dart';
import 'package:skill_swap/features/home/models/mentor_model.dart';
import 'package:skill_swap/features/home/presentation/widgets/categories.dart';
import 'package:skill_swap/features/home/presentation/widgets/featured_mentors.dart';
import 'package:skill_swap/features/home/presentation/widgets/header.dart';
import 'package:skill_swap/features/home/presentation/widgets/top_rated.dart';
import 'package:skill_swap/features/profile/presentation/controller/profile_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  final List<CategoryModel> categories = CategoriesData.categories;
  final List<MentorModel> featuredMentors = MentorData.mentors;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileProvider>().profile;

    if(profile == null){
      return const Scaffold(body: CircularProgressIndicator());
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(searchController: _searchController,profile: profile,),
          // const SizedBox(height: AppSpacing.xl),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.xl),
                  Text(AppString.categories,style: context.appTextTheme.titleLarge,),
                  const SizedBox(height: AppSpacing.md),
                  Categories(categories: categories),
                  const SizedBox(height: AppSpacing.xl),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppString.featuredMentors,style: context.appTextTheme.titleLarge,),
                      TextButton(
                          style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap
                          ),
                          onPressed: (){}, child: const Text(AppString.seeAll))
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),

                  FeaturedMentors(featuredMentors: featuredMentors,),

                  const SizedBox(height: AppSpacing.xl),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppString.topRated,style: context.appTextTheme.titleLarge,),
                      TextButton(
                          style: TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap
                          ),
                          onPressed: (){}, child: const Text(AppString.seeAll))
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TopRated(featuredMentors: featuredMentors),
                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
